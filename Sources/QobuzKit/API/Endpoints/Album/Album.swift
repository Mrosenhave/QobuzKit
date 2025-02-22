//
//  Album.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 21/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the metadata for an album and its tracks.
   
   Tracks with its `streamable` tag marked true can be streamed by the authenticated user. This value is determined by the user credentials and the tracks availability.
   
   `purchasable_at` and `streamable_at` indicates when the product will become available to stream or download.
   
   `product_type`, `released_at` and `created_at` are deprecated.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter albumId: The id of the desired album
   - Parameter extra: Additional info to be included
   - Parameter limit: Limit of returned tracks (default: 1200)
   - Parameter offset: Offset of the first track (default: 0)
   
   - Returns: A QBAlbum object
   */
  public struct Album: Endpoint {
    
    public init(albumId: String, extra: [Album.albumExtra]? = nil, limit: Int? = nil, offset: Int? = nil) {
      self.parameters = [URLQueryItem(name: QobuzAPI.Parameters.albumId(), value: albumId)]
      if let extra {
        self.parameters.append(URLQueryItem(name: QobuzAPI.Parameters.extra(), value: extra.map({$0.rawValue}).joined(separator: ",")))
      }
      if let limit {
        self.parameters.append(URLQueryItem(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(URLQueryItem(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
    }
    

    public typealias Response = QBAlbum

    public var path: String = "album/get"

    public var parameters: [URLQueryItem]

    public enum albumExtra: String, CaseIterable {
      case trackIds = "track_ids"
      case albumsSameArtist = "albumsFromSameArtist"
      case focus = "focus"
      case focusAll = "focusAll"
    }
  }
}
