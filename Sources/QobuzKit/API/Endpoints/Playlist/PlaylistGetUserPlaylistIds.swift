//
//  PlaylistGetUserPlaylistIds.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 19/06/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Get both public and private playlist ids of the authenticated user.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Returns: A QBUserPlaylistIds object.
  */
  public struct PlaylistGetUserPlaylistIds: Endpoint {
    public init() {
      self.parameters = [URLQueryItem]()
    }

    
    public typealias Response = QBUserPlaylistIds

    public let path: String = "playlist/getUserPlaylistIds"
    
    public var parameters: [URLQueryItem]
  }
}
