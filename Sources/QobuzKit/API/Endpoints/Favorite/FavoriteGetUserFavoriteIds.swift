//
//  FavoriteGetUserFavoriteIds.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the authenticated user favorites Ids.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Returns: A QBUserFavoriteIds object.
   */
  public struct FavoriteGetUserFavoriteIds: Endpoint {
    public init() {
      self.parameters = [URLQueryItem]()
    }
    
    
    public typealias Response = QBUserFavoriteIds

    public let path: String = "favorite/getUserFavoriteIds"

    public var parameters: [URLQueryItem]
  }
}
