//
//  QueryItemBuilder.swift
//
//
//  Created by Oleksandr Riabchuk on 26.03.2023.
//

/// A result builder that enables the use of multiple `QueryItem` values in a single expression, allowing for more concise and readable code.
///
/// Example usage:
/// ```
/// let myQueryItems = QueryItemBuilder {
///     QueryItem(name: "q", value: "search term")
///     QueryItem(name: "limit", value: "10")
///     QueryItem(name: "page", value: "1")
/// }
/// ```
@resultBuilder
public enum QueryItemBuilder {
    /// A type alias for `QueryGroup`. `Exception` can be used interchangeably with `QueryGroup`.
    public typealias Exception = QueryGroup

    /// A type alias for `QueryItem`. `Component` can be used interchangeably with `QueryItem`.
    public typealias Component = QueryItem

    /// Builds an array of `QueryItem` objects from one or more `QueryItem` values.
    ///
    /// - Parameter components: One or more `QueryItem` values to include in the array.
    ///
    /// - Returns: An array of `QueryItem` objects.
    @inlinable
    public static func buildBlock(
        _ components: QueryGroup...
    ) -> [Component] {
        components.flatMap { $0.queryItem }
    }

    /// Returns an array of `QueryItemBuilder.Component` objects that represent each individual component of the given `QueryGroup`.
    ///
    /// - Parameter expression: A `QueryGroup` object that represents a group of one or more query items.
    ///
    /// - Returns: An array of `QueryItemBuilder.Component` objects that represent each individual component of the `QueryGroup` as a separate component.
    @inlinable ///
    public static func buildExpression(
        _ expression: QueryGroup
    ) -> [QueryItemBuilder.Component] {
        expression.queryItem
    }

    /// Returns an array of `QueryItemBuilder.Component` objects that represent an access token.
    ///
    /// - Parameter expression: An `AccessToken` object that holds an access token key and its corresponding value.
    ///
    /// - Returns: An array of `QueryItemBuilder.Component` objects that contains a single `Component` with the access token key as the component key and the access token value as the component value.
    @inlinable
    public static func buildExpression(
        _ expression: AccessToken
    ) -> [QueryItemBuilder.Component] {
        switch expression.key {
        case .accessToken:
            return [Component(key: "access_token", value: expression.getAccessToken())]
        case .tokenX:
            // TODO: OR | Fix value for tokenX
            return [Component(key: "tokenX", value: expression.getAccessToken())]
        }
    }

    /// Builds an array of `QueryItem` objects from an optional array of `QueryItem` values.
    ///
    /// - Parameter component: An optional array of `QueryItem` values to include in the array.
    ///
    /// - Returns: An array of `QueryItem` objects, or an empty array if the input is nil.
    ///
    @inlinable
    public static func buildOptional(
        _ component: [Component]?)
    -> [Component] {
        component ?? []
    }

    /// Builds an array of `QueryItem` objects from the first of two possible arrays of `QueryItem` values.
    ///
    /// - Parameter component: An array of `QueryItem` values to include in the output array.
    ///
    /// - Returns: An array of `QueryItem` objects.
    @inlinable
    public static func buildEither(
        first component: [Component]
    ) -> [Component] {
        component
    }

    /// Builds an array of `QueryItem` objects from the second of two possible arrays of `QueryItem` values.
    ///
    /// - Parameter component: An array of `QueryItem` values to include in the output array.
    ///
    /// - Returns: An array of `QueryItem` objects.
    @inlinable
    public static func buildEither(
        second component: [Component]
    ) -> [Component] {
        component
    }
}
