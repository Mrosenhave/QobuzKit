//
//  AlbumSuggest.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 18/06/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the suggested albums for an album.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter albumId: The id of the album to get suggestions for
   
   - Returns: A QBAlbumSuggest object
   */
  public struct AlbumSuggest: Endpoint {
    
    public init(
      albumId: String
    ) {
      self.parameters = [
        URLQueryItem(name: QobuzAPI.Parameters.albumId(), value: albumId)
      ]
    }
    

    public typealias Response = QBAlbumSuggest

    public let path: String = "album/suggest"

    public var parameters: [URLQueryItem]
  }
}
