//
//  QueryItem.swift
//
//
//  Created by Oleksandr Riabchuk on 26.03.2023.
//

/// A query item representing a single key-value pair.
public struct QueryItem: QueryItemProtocol, QueryGroup {
    /// The array of query item.
    public var queryItem: [QueryItem] { [self] }

    /// The key of the query item.
    public var key: String

    /// The value of the query item.
    public var value: String

    /// Initializes a new `QueryItem` instance with a given key and value.
    ///
    /// - Parameters:
    ///   - key: The key of the query item.
    ///   - value: The value of the query item.
    public init(key: String,
                value: String) {
        self.key = key
        self.value = value
    }
}
