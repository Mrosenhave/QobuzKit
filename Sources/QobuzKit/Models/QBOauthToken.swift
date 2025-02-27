//
//  QBOauthToken.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 25/02/2025.
//

// MARK: - QBOauthToken
public struct QBOauthToken: Codable {
    public let expiresIn: Int
    public let tokenType: String
    public let accessToken: String
    public let refreshToken: String

    public enum CodingKeys: String, CodingKey {
        case expiresIn = "expires_in"
        case tokenType = "token_type"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }

    public init(expiresIn: Int, tokenType: String, accessToken: String, refreshToken: String) {
        self.expiresIn = expiresIn
        self.tokenType = tokenType
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
