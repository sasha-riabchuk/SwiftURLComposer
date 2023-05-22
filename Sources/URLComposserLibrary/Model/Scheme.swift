//
//  Scheme.swift
//
//
//  Created by Oleksandr Riabchuk on 28.03.2023.
//

import Foundation

/// The supported URL schemes for a Domain.
public enum Scheme: String {
    /// This scheme represents the HTTP protocol.
    case http

    /// This scheme represents the HTTPS protocol.
    case https

    /// This scheme represents the SSH protocol.
    case ssh

    /// This scheme represents the FTP protocol.
    case ftp
}
