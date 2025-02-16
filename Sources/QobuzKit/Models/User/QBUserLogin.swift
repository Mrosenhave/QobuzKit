//
//  QBUserLogin.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

struct QBUserLogin: Codable {
    let user: QBUser
    let userAuthToken: String
    
    
    enum CodingKeys: String, CodingKey {
        case user
        case userAuthToken = "user_auth_token"
    }
}
