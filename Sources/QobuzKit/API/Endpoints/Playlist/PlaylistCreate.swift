//
//  PlaylistCreate.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Create a playlist on behalf of the authenticated user.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter name: The playlists name
   - Parameter description: The playlists description
   - Parameter trackIds: The playlists inital tracks
   - Parameter albumId: The playlists inital tracks from an album
   - Parameter isPublic: Make the playlist public
   - Parameter isCollaborative: Make the playlist collaborative
   
   - Returns: A QBPlaylist object without tracks.
  */
  public struct PlaylistCreate: Endpoint {
    public init(
      name: String,
      description: String? = nil,
      trackIds: Int...,
      albumId: String? = nil,
      isPublic: Bool? = nil,
      isCollaborative: Bool? = nil
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.name(), value: name)]
      if let description {
        self.parameters.append(.init(name: QobuzAPI.Parameters.description(), value: description))
      }
      let trackIdsString = trackIds.map({String($0)}).joined(separator: ",")
      self.parameters.append(.init(name: QobuzAPI.Parameters.trackIds(), value: trackIdsString))
      
      if let albumId {
        self.parameters.append(.init(name: QobuzAPI.Parameters.albumId(), value: albumId))
      }
      
      if let isPublic {
        self.parameters.append(.init(name: QobuzAPI.Parameters.isPublic(), value: String(isPublic)))
      }
      
      if let isCollaborative {
        self.parameters.append(.init(name: QobuzAPI.Parameters.isCollaborative(), value: String(isCollaborative)))
      }
      
    }

    public typealias Response = QBPlaylist

    public let path: String = "playlist/create"

    public var parameters: [URLQueryItem]

  }
}
