//
//  PlaylistUnsubscribe.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Unubscribe the authenticated user from the playlist.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter playlistId: The playlist to unsubscribe from
   
   - Returns: A QBStatus object.
  */
  public struct PlaylistUnsubscribe: Endpoint {
    public init(
      playlistId: Int
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.playlistId(), value: String(playlistId))]
    }

    public typealias Response = QBStatus

    public let path: String = "playlist/unsubscribe"

    public var parameters: [URLQueryItem]

  }
}
