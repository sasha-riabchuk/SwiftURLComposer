//
//  QueryGroupProtocol.swift
//
//
//  Created by Oleksandr Riabchuk on 28.03.2023.
//

/// This is a protocol that can be adopted to define a type that represents a group of query items for a URL.
public protocol QueryGroup {
    /// This property represents an array of query items that belong to the group.
    var queryItem: [QueryItem] { get }
}
