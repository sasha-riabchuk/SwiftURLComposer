//
//  URLComposerError.swift
//
//
//  Created by Oleksandr Riabchuk on 28.03.2023.
//

import Foundation

/// An error that can occur during the construction of a URL Composer.
public enum URLComposerError: Error {
    /// This case represents an error with a descriptive message.
    case error(String)
}
