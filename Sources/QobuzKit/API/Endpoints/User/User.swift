//
//  User.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return information of the authenticated user.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   
   - Returns: A QBUser object.
  */
  public struct User: Endpoint {
    public init(
    ) {
      self.parameters = [URLQueryItem]()
    }

    public typealias Response = QBUser

    public let path: String = "user/get"

    public var parameters: [URLQueryItem]
  }
}
