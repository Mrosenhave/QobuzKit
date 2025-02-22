//
//  FavoriteGetUserFavorites.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the authenticated user favorites filtered by item type.
   
   The API does not include duplicates so amount may be lower than limit.
   
   Recommended to call with offset until 0 results to ensure all favorites are returned.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter type: Type of favorite
   - Parameter limit: Maximum number of fav items (default: 50, max: 500)
   - Parameter offset: Offset of first item (default: 0)
   
   - Returns: A QBUserFavorites object.
   */
  public struct FavoriteGetUserFavorites: Endpoint {
    public init(type:  favoriteType? = nil, limit: Int? = nil, offset: Int? = nil) {
      self.parameters = [URLQueryItem]()
      
      if let type {
        self.parameters.append(.init(name: QobuzAPI.Parameters.type(), value: type.rawValue))
      }
      
      if let limit {
        self.parameters.append(.init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(.init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
    }
    
    
    public typealias Response = QBUserFavorites

    public let path: String = "favorite/getUserFavorites"

    public var parameters: [URLQueryItem]

    public enum favoriteType: String, CaseIterable {
      case tracks
      case albums
      case artists
      case articles
    }
  }
}
