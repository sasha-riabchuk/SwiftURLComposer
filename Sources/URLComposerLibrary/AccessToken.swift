//
//  AccessToken.swift
//
//
//  Created by Oleksandr Riabchuk on 27.03.2023.
//

/// A query item representing a single key-value pair.
public struct AccessToken: QueryItemProtocol {
    // TODO: Call get access token here.

    /// The key of the query item.
    public var key: AccessTokenType

    /// Initializes a new `QueryItem` instance with a given key and value.
    ///
    /// - Parameters:
    ///   - key: The key of the query item.
    ///   - value: The value of the query item.
    public init(key: AccessTokenType) {
        self.key = key
    }

    public func getAccessToken() -> String {
        switch key {
        case .tokenX(let token):
            // TODO: OR | Implement tokenX.
            return ""
        case .accessToken(let token):
            return token
        }
    }
}
