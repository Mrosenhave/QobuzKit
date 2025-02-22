//
//  Playlist.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Get the metadata for a playlist, including tracks and subscribers.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter playlistId: The desired playlist
   - Parameter extra: Additional desired metadata
   - Parameter limit: Maximum number of tracks (default: 50)
   - Parameter offset: Offset of the first track (default: 0)
   
   - Returns: A QBPlaylist object. The `Stores` field is only populated if the playlist is featured.
  */
  public struct Playlist: Endpoint {
    public init(
      playlistId: Int,
      extra: playlistExtra...,
      limit: Int? = nil,
      offset: Int? = nil
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.playlistId(), value: String(playlistId))]
      
      let extraString = extra.map({$0.rawValue}).joined(separator: ",")
      self.parameters.append(.init(name: QobuzAPI.Parameters.extra(), value: extraString))
      
      if let limit {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
    }

    public typealias Response = QBPlaylist

    public let path: String = "playlist/get"

    public var parameters: [URLQueryItem]

    public enum playlistExtra: String, CaseIterable {
      case tracks
      case getSimilarPlaylists
      case subscribers
      case focus
      case focusAll
      case trackIds = "track_ids"
    }
  }
}
