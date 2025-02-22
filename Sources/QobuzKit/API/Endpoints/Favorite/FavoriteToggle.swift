//
//  FavoriteToggle.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//


import Foundation

extension QobuzAPI.Endpoints {
  /**
   Toggle the favorite status of an item related to a user.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter itemId: The item id
   - Parameter type: The type of the item
   
   - Returns: A QBStatusBool object reflecting the new favorite status.
  */
  public struct FavoriteToggle: Endpoint {
    public init(
      itemId: String,
      type: favoriteType
    ) {
      self.parameters = [
        .init(name: QobuzAPI.Parameters.itemId(), value: itemId),
        .init(name: QobuzAPI.Parameters.type(), value: type.rawValue)
      ]
      
    }

    public typealias Response = QBStatusBool

    public let path: String = "favorite/toggle"

    public var parameters: [URLQueryItem]

    public enum favoriteType: String {
      case album
      case track
      case artist
      case article
    }
  }
}
