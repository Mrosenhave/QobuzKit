//
//  PlaylistGetTags.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return all tags related to Qobuz service playlists.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   
   - Returns: A QBTagList object.
  */
  public struct PlaylistGetTags: Endpoint {
    public init() {
      self.parameters = [URLQueryItem]()
    }

    public typealias Response = QBTagList

    public let path: String = "playlist/getTags"

    public var parameters: [URLQueryItem]
  }
}
