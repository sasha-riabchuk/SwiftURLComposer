//
//  AccessTokenType.swift
//
//
//  Created by Oleksandr Riabchuk on 28.03.2023.
//

/// This is an enumeration defining two types of access tokens.
public enum AccessTokenType {
    /// This type of access token is represented by the string "tokenx".
    case tokenX(String)

    /// This type of access token is represented by the string "access_token".
    case accessToken(String)
}
