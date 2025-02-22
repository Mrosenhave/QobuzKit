//
//  PlaylistUpdateTracksPosition.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Update the tracks position in the playlist. Require playlist owner authentication except if the playlist is public
   and collaborative.

   This method helps you bulk-reorder tracks and insert them elsewhere in the playlist. To understand the
   `insert_before` parameter, imagine that you can select a bunch of tracks in a playlist and drag and drop
   them anywhere in the playlist.

   ## Authentication
   Requires a valid app_id and, if playlist is not public and collaborative, user_auth_token.

   - Parameter playlistId: The playlist ID to update the tracks position of.
   - Parameter insertBefore: The playlist position where to start replacing the tracks position.
   - Parameter playlistTrackIds: Ordered list of playlist track IDs.

   - Returns: A QBPlaylist object without tracks.
  */
  public struct PlaylistUpdateTracksPosition: Endpoint {
    public init(
      playlistId: Int,
      insertBefore: Int,
      playlistTrackIds: Int...
    ) {
      self.parameters = [
        .init(name: QobuzAPI.Parameters.playlistId(), value: String(playlistId)),
        .init(name: QobuzAPI.Parameters.insertBefore(), value: String(insertBefore))
      ]
      let playlistTrackIdsString = playlistTrackIds.map({String($0)}).joined(separator: ",")
      self.parameters.append(.init(name: QobuzAPI.Parameters.playlistTrackIds(), value: playlistTrackIdsString))
    }

    public typealias Response = QBPlaylist

    public let path: String = "playlist/updateTracksPosition"

    public var parameters: [URLQueryItem]

  }
}
