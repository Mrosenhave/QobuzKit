//
//  Oauth2.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 25/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Login a customer.
   
   
   - Parameter username: The user login or email
   - Parameter password: The users password (This is encrypted automatically before sending request)
   
   ## Authentication
   Requires a valid client_id and client_secret.
   
   
   - Returns: A QBUserLogin object. Includes the **user auth token**.
  */
  public struct OauthLogin: Endpoint {
    public init(
      username: String,
      password: String,
      appSecret: String
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.username(), value: username)]
      let hashedPassword = self.calculateMD5Hash(for: password)
      self.parameters.append(.init(name: QobuzAPI.Parameters.password(), value: hashedPassword))
      
      self.parameters.append(contentsOf: self.signRequest(appSecret: appSecret))
    }

    public typealias Response = QBUserLogin

    public let path: String = "oauth2/login"

    public var parameters: [URLQueryItem]
    
    public enum userLoginExtra: String {
      case partner
    }
  }
}
