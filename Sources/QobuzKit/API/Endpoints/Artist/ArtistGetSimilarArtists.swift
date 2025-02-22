//
//  ArtistGetSimilarArtists.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return similar artists for an artist.

   **Will be DEPRECATED use ArtistPage**
   
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter artistId: Id of the desired artist to find the similar artists of
   - Parameter limit: Maximum number of albums (default: 25, max: 100)
   - Parameter offset: Offset of the first album (default: 0)
   
   - Returns: A QBSearch object with only artists.
  */
  public struct ArtistGetSimilarArtists: Endpoint {
    public init(artistId: Int, limit: Int? = nil, offset: Int? = nil) {
      self.parameters = [.init(name: QobuzAPI.Parameters.artistId(), value: String(artistId))]
      
      
      if let limit {
        self.parameters.append(.init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(.init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
    }

    public typealias Response = QBSearch

    public let path: String = "artist/getSimilarArtists"

    public var parameters: [URLQueryItem]

  }
}
