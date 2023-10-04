//
//  Domain.swift
//
//
//  Created by Oleksandr Riabchuk on 26.03.2023.
//

import Foundation

/// A representation of a domain name that can be used to build a URL.
///
/// Example usage:
/// ```
/// let myDomain = Domain(scheme: .https, domain: "example.com") {
///     Path {
///         "/myPath"
///         QueryItem(name: "q", value: "search term")
///     }
/// }
/// let urlComponents = try myDomain.build()
/// let url = urlComponents.url
/// ```
public struct Domain {
    private let domain: String
    private let scheme: Scheme
    private var path: Path?

    /// Creates a new instance of `Domain`.
    ///
    /// - Parameters:
    ///   - scheme: The scheme to use for the URL (e.g. "http", "https").
    ///   - domain: The domain name to use for the URL.
    ///   - path: An optional `Path` object to use as the URL path.
    public init(scheme: Scheme,
                domain: String,
                path: Path?) {
        self.scheme = scheme
        self.domain = domain
        self.path = path
    }

    /// Creates a new instance of `Domain` using a result builder to build the URL path.
    ///
    /// - Parameters:
    ///   - scheme: The scheme to use for the URL (e.g. "http", "https").
    ///   - domain: The domain name to use for the URL.
    ///   - pathBuilder: A closure that returns a `Path` object.
    public init(scheme: Scheme,
                domain: String,
                @PathBuilder pathBuilder: () -> Path) {
        self.init(scheme: scheme, domain: domain, path: pathBuilder())
    }

    /// Calls the `perform()` function and returns the resulting `URL`.
    ///
    /// - Throws: An error if the `perform()` function throws an error.
    ///
    /// - Returns: The `URL` returned by the `perform()` function.
    public func callAsFunction() throws -> URL {
        try perform()
    }

    /// Builds a `URLComponents` object from the `Domain`.
    ///
    /// - Returns: A `URL` object.
    ///
    /// - Throws: A `URLComposerError` if the `Path` object is nil or failed to create URL.
    public func perform() throws -> URL {
        var urlComponents = URLComponents()

        guard let path else {
            throw URLComposerError.error("Cannot find path.")
        }

        urlComponents.scheme = scheme.rawValue
        urlComponents.host = domain
        urlComponents.path = path.path

        // TODO: OR | refactor this. AccessToken should be parsed as default queryItem
        if let queryItems = path.queryItems.map({ $0.map { $0 as? QueryItem } }) {
            if let access = queryItems.first(where: { $0?.key == "access_token" }) {
                urlComponents.fragment = "\(access?.key ?? "")=\(access?.value ?? "")"
            }

            urlComponents.queryItems = queryItems.map { item in
                if item?.key != "access_token" {
                    return URLQueryItem(name: item?.key ?? "", value: item?.value)
                } else {
                    return .init(name: "", value: "")
                }
            }
        }

        guard let url = urlComponents.url else {
            throw URLComposerError.error("Failed to create URL. The URL is either nil or malformed.")
        }

        return url
    }
}
