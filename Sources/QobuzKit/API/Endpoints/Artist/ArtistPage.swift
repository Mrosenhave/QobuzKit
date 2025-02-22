//
//  ArtistPage.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the artist page for desired artist.
   
   Artist page includes:
   - generic information such as name, biography
   - similar artist
   - releases grouped by type
   - most popular tracks
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter artistId: Id of the desired artist to find the similar artists of
   - Parameter sort: how to sort the releases
   - Parameter order: how to order the releases
   
   - Returns: A QBArtistPage object.
  */
  public struct ArtistPage: Endpoint {
    public init(
      artistId: Int,
      sort: QobuzAPI.artistReleaseSortType? = nil,
      order: QobuzAPI.artistReleaseOrderType? = nil
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.artistId(), value: String(artistId))]
      
      if let sort {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.sort(), value: sort.rawValue))
      }
      
      if let order {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.order(), value: order.rawValue))
      }
    }

    public typealias Response = QBArtistPage

    public let path: String = "artist/page"

    public var parameters: [URLQueryItem]

  }
}
