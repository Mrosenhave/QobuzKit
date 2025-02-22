//
//  PlaylistUpdate.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Update a playlist. Require playlist owner authentication except if the playlist is public and collaborative.
   
   **NB : If you provide track_ids with this method, the current tracks of the playlist will be removed before adding the new ones.**
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter playlistId: The playlist to update
   - Parameter name: The updated name
   - Parameter description: The updated description
   - Parameter isPublic: The updated isPublic flag
   - Parameter isCollaborative: The updated isCollaborative flag
   - Parameter trackIds: The tracks to replace the playlist tracks with
   
   - Returns: A QBPlaylist object without tracks.
  */
  public struct PlaylistUpdate: Endpoint {
    public init(
      playlistId: Int,
      name: String? = nil,
      description: String? = nil,
      isPublic: Bool? = nil,
      isCollaborative: Bool? = nil,
      trackIds: Int...
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.playlistId(), value: String(playlistId))]
      
      if let name {
        self.parameters.append(.init(name: QobuzAPI.Parameters.name(), value: name))
      }
      if let description {
        self.parameters.append(.init(name: QobuzAPI.Parameters.description(), value: description))
      }
      
      if let isPublic {
        self.parameters.append(.init(name: QobuzAPI.Parameters.isPublic(), value: String(isPublic)))
      }
      
      if let isCollaborative {
        self.parameters.append(.init(name: QobuzAPI.Parameters.isCollaborative(), value: String(isCollaborative)))
      }
      
      let trackIdsString = trackIds.map({String($0)}).joined(separator: ",")
      self.parameters.append(.init(name: QobuzAPI.Parameters.trackIds(), value: trackIdsString))
    }

    public typealias Response = QBPlaylist

    public let path: String = "playlist/update"

    public var parameters: [URLQueryItem]

  }
}
