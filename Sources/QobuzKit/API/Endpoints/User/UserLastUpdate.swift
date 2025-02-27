//
//  UserLastUpdate.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return last update information for API services
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   
   - Returns: A QBLastUpdate object.
  */
  public struct UserLastUpdate: Endpoint {
    public init(
    ) {
      self.parameters = [URLQueryItem]()
    }

    public typealias Response = QBLastUpdate

    public let path: String = "user/lastUpdate"

    public var parameters: [URLQueryItem]
  }
}
