//
//  PlaylistGetUserPlaylists.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Get both public and private playlists of the authenticated user.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   - Parameter filter: Type of playlists to return (`.owner`, `.subscriber` or `nil` for both)
   - Parameter sort: How to sort the playlists (default: `.position`)
   - Parameter order: How to order the playlists (default: `.descending`)
   
   - Returns: A QBUserPlaylists object.
  */
  public struct PlaylistGetUserPlaylists: Endpoint {
    public init(
      filter: userPlaylistFilter? = nil,
      sort: userPlaylistSort? = nil,
      order: userPlaylistOrder? = nil
    ) {
      self.parameters = [URLQueryItem]()
      if let filter {
        self.parameters.append(.init(name: QobuzAPI.Parameters.filter(), value: filter.rawValue))
      }
      if let sort {
        self.parameters.append(.init(name: QobuzAPI.Parameters.sort(), value: sort.rawValue))
      }
      if let order {
        self.parameters.append(.init(name: QobuzAPI.Parameters.order(), value: order.rawValue))
      }
    }

    public typealias Response = QBUserPlaylists

    public let path: String = "playlist/getUserPlaylists"

    public var parameters: [URLQueryItem]
    
    public enum userPlaylistFilter: String, CaseIterable {
      case owner
      case subscriber
    }
    
    public enum userPlaylistSort: String, CaseIterable {
      case updatedAt = "updated_at"
      case position
    }
    
    public enum userPlaylistOrder: String, CaseIterable {
      case ascending = "asc"
      case descending = "desc"
    }
  }
}
