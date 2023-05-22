//
//  Array+QueryGroup.swift
//
//
//  Created by Oleksandr Riabchuk on 28.03.2023.
//

/// This is an extension of the Array type that adopts the QueryGroup protocol for arrays of QueryItem elements.
extension Array: QueryGroup where Element == QueryItem {
    /// This computed property returns the array itself as the query items for the group.
    public var queryItem: [QueryItem] { self }
}
