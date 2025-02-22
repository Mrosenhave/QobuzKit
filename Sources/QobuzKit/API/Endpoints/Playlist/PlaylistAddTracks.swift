//
//  PlaylistAddTracks.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Add tracks to the playlist. Require playlist owner authentication except if the playlist is public and collaborative.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter playlistId: The playlist to add tracks to
   - Parameter trackIds: The track ids to be added
   - Parameter noDuplicate: Refuse to add selected tracks if there are any duplicates.
   
   - Returns: A QBPlaylist object without tracks.
  */
  public struct PlaylistAddTracks: Endpoint {
    public init(
      playlistId: Int,
      trackIds: Int...,
      noDuplicate: Bool? = nil
    ) {
      self.parameters = [
        .init(name: QobuzAPI.Parameters.playlistId(), value: String(playlistId)),
        .init(name: QobuzAPI.Parameters.trackIds(), value: trackIds.map({String($0)}).joined(separator: ","))
      ]
      if let noDuplicate {
        self.parameters.append(.init(name: QobuzAPI.Parameters.noDuplicate(), value: String(noDuplicate)))
      }
    }

    public typealias Response = QBPlaylist

    public let path: String = "playlist/addTracks"

    public var parameters: [URLQueryItem]

  }
}
