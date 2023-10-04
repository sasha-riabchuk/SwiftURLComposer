//
//  Path.swift
//
//
//  Created by Oleksandr Riabchuk on 26.03.2023.
//

/// A URL path and associated query items.
public struct Path {
    /// The path component of the URL.
    public var path: String

    /// The query items associated with the path.
    public var queryItems: [QueryItemProtocol]?

    /// Initializes a new `Path` instance with a given path and query items.
    ///
    /// - Parameters:
    ///   - path: The path component of the URL.
    ///   - queryItems: The query items associated with the path.
    public init(_ path: String,
                queryItems: [QueryItemProtocol]) {
        self.path = path
        self.queryItems = queryItems
    }

    /// Initializes a new `Path` instance with a given path and query item.
    ///
    /// - Parameters:
    ///   - path: The path component of the URL.
    ///   - queryItems: The query item associated with the path.
    public init(_ path: String,
                queryItem: QueryItemProtocol) {
        self.path = path
        queryItems = [queryItem]
    }

    /// Initializes a new `Path` instance with a given path and query item.
    ///
    /// - Parameters:
    ///   - path: The path component of the URL.
    public init(_ path: String) {
        self.path = path
        queryItems = []
    }

    /// Initializes a new `Path` instance with a given path and a query item builder.
    ///
    /// - Parameters:
    ///   - path: The path component of the URL.
    ///   - queryItemBuilder: A closure that returns an array of `QueryItem`s.
    public init(_ path: String,
                @QueryItemBuilder queryItemBuilder: () -> [QueryItemProtocol]) {
        self.init(path, queryItems: queryItemBuilder())
    }

    /// Initializes a new `Path` instance with a given path and a query item builder.
    ///
    /// - Parameters:
    ///   - path: The path component of the URL.
    ///   - queryItemBuilder: A closure that returns an instance of `QueryItem`.
    public init(_ path: String,
                @QueryItemBuilder queryItemBuilder: () -> QueryItemProtocol) {
        self.init(path, queryItem: queryItemBuilder())
    }
}
