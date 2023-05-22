//
//  PathBuilder.swift
//
//
//  Created by Oleksandr Riabchuk on 26.03.2023.
//

/// A result builder that enables the use of multiple `Path` values in a single expression, allowing for more concise and readable code.
///
/// Example usage:
///
/// -  Path without query params
/// ```
/// let myPath = PathBuilder {
///   Path("/application/crs",queryItems: [])
/// }
/// ```
/// - Path with query params
/// ```
/// let myPath = PathBuilder {
///   Path("/application/crs") {
///     QueryItem(key: "id", value: "someID")
///   }
/// }
///
/// ```
@resultBuilder
public enum PathBuilder {
    public typealias Component = Path

    /// Builds a `Path` object from a single `Path` value.
    ///
    /// - Parameter path: The `Path` value to use.
    ///
    /// - Returns: The input `Path` value.
    @inlinable
    public static func buildBlock(
        _ path: Component
    ) -> Component {
        path
    }
}
