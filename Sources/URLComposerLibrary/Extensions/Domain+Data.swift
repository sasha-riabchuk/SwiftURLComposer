//
//  Domain+Data.swift
//
//
//  Created by Oleksandr Riabchuk on 28.03.2023.
//
import Foundation

public extension Domain {
    /// Returns the `absoluteString` of the `URL` returned by the `perform()` method as a `Data` object.
    ///
    /// - Throws: An error if the `perform()` method throws an error.
    ///
    /// - Returns: The `absoluteString` of the `URL` returned by the `perform()` method as a `Data` object.
    ///
    /// - Note: The `absoluteString` is converted to a `Data` object using its UTF-8 representation.
    ///
    /// - Warning: This method assumes that the `perform()` method returns a valid `URL`. If `perform()` returns `nil`,
    ///            this method will crash at runtime.
    ///
    /// - Returns: The `absoluteString` of the `URL` returned by the `perform()` method as a `Data` object.
    func asData() throws -> Data {
        let url = try perform()
        return Data(url.absoluteString.utf8)
    }
}
