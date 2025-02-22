//
//  PlaylistUpdatePlaylistsPosition.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Updates the user playlists display order.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter playlistIds: Ordered list of playlist IDs.
   
   - Returns: A QBStatus object.
  */
  public struct PlaylistUpdatePlaylistsPosition: Endpoint {
    public init(
      playlistIds: Int...
    ) {
      let playlistIdsString = playlistIds.map({String($0)}).joined(separator: ",")
      self.parameters = [.init(name: QobuzAPI.Parameters.playlistIds(), value: playlistIdsString)]
    }

    public typealias Response = QBStatus

    public let path: String = "playlist/updatePlaylistsPosition"

    public var parameters: [URLQueryItem]

  }
}
