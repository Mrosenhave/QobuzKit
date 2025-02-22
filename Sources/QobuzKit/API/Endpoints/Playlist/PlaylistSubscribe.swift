//
//  PlaylistSubscribe.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//


import Foundation

extension QobuzAPI.Endpoints {
  /**
   Subscribe the authenticated user to the playlist.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter playlistId: The playlist to subscribe to
   
   - Returns: A QBStatus object.
  */
  public struct PlaylistSubscribe: Endpoint {
    public init(
      playlistId: Int
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.playlistId(), value: String(playlistId))]
    }

    public typealias Response = QBStatus

    public let path: String = "playlist/subscribe"

    public var parameters: [URLQueryItem]

  }
}
