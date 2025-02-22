//
//  PlaylistDeleteTracks.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Delete tracks from the playlist. Require playlist owner authentication except if the playlist is public and collaborative.
   
   ## Authentication
   Requires a valid app_id and, if playlist is not public and collaborative, user_auth_token.
   
   - Parameter playlistId: The playlist to delete tracks from
   - Parameter playlistTrackIds: The playlist tracks to delete. Get this from the **Playlist** endpoint.
   
   - Returns: A QBStatus object.
  */
  public struct PlaylistDeleteTracks: Endpoint {
    public init(
      playlistId: Int,
      playlistTrackIds: Int...
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.playlistId(), value: String(playlistId))]
      let playlistTrackIdsString = playlistTrackIds.map({String($0)}).joined(separator: ",")
      self.parameters.append(.init(name: QobuzAPI.Parameters.playlistTrackIds(), value: playlistTrackIdsString))
    }

    public typealias Response = QBStatus

    public let path: String = "playlist/deleteTracks"

    public var parameters: [URLQueryItem]

  }
}
