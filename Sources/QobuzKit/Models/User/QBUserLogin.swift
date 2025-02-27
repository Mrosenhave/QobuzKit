//
//  QBUserLogin.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public struct QBUserLogin: Codable {
  public let status: String? = nil
    public let user: QBUser
    public let userAuthToken: String
    
    
    enum CodingKeys: String, CodingKey {
        case status
        case user
        case userAuthToken = "user_auth_token"
    }
}
