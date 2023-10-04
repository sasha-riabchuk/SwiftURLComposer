//
//  QueryItem+base64.swift
//
//
//  Created by Oleksandr Riabchuk on 28.03.2023.
//

public extension QueryItem {
    /// Returns a new `QueryItem` object with its value encoded in base64.
    ///
    /// - Returns: A new `QueryItem` object with its `value` property encoded in base64.
    ///
    /// - Note: If encoding fails, the `value` property of the new `QueryItem` object will be an empty string.
    ///
    /// - Warning: This method assumes that the `value` property of the `QueryItem` is a string that can be
    ///            encoded in UTF-8 format. If `value` is `nil` or cannot be encoded in UTF-8 format, the
    ///            resulting `QueryItem` will have an empty `value` property.
    ///
    /// - Returns: A new `QueryItem` object with its `value` property encoded in base64.
    func base64Encoded() -> QueryItem {
        .init(key: key, value: value.data(using: .utf8)?.base64EncodedString() ?? "")
    }
}
