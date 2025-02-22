//
//  Artist.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
  Return the metadata for an artist.

   **Will be DEPRECATED**
   
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter artistId: Id of the desired artist
   - Parameter extra: Additional content for the artist
   - Parameter limit: Maximum number of albums (default: 25, max: 500)
   - Parameter offset: Offset of the first album (default: 0)
   
   - Returns: A QBArtist object.
  */
  public struct Artist: Endpoint {
    public init(artistId: Int, extra: artistExtras?, limit: Int? = nil, offset: Int? = nil) {
      self.parameters = [.init(name: QobuzAPI.Parameters.artistId(), value: String(artistId))]
      
      if let extra {
        self.parameters.append(.init(name: QobuzAPI.Parameters.extra(), value: extra.rawValue))
      }
      
      if let limit {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
    }

    public typealias Response = QBArtist

    public let path: String = "artist/get"

    public var parameters: [URLQueryItem]

    public enum artistExtras: String, CaseIterable {
      case albums
      case playlists
      case albumsWithLastRelease = "albums_with_last_release"
      case tracksAppearsOn = "tracks_appears_on"
    }
  }
}
