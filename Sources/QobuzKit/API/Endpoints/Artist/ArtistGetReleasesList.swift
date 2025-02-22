//
//  ArtistGetReleasesList.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the releases list with the tracklist.
   
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter artistId: Id of the desired artist
   - Parameter releaseType: filter by type of release
   - Parameter sort: how to sort the releases
   - Parameter order: how to order the releases
   - Parameter filter: how to filter the releases
   - Parameter limit: Maximum number of albums (min: 1, default: 50, max: 100)
   - Parameter offset: Offset of the first album (default: 0)
   - Parameter trackSize: maximum number of tracks per album  (min : 0, default : 10, max : 30)
   
   - Returns: A QBHasMoreItems\<QBArtistRelease\> object with tracks
  */
  public struct ArtistGetReleasesList: Endpoint {
    public init(
      artistId: Int,
      releaseType : QobuzAPI.artistReleaseType...,
      sort: QobuzAPI.artistReleaseSortType? = nil,
      order: QobuzAPI.artistReleaseOrderType? = nil,
      filter: QobuzAPI.artistReleaseFilterType...,
      limit: Int? = nil,
      offset: Int? = nil
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.artistId(), value: String(artistId))]
      
      let typeString = releaseType.map({$0.rawValue}).joined(separator: ",")
      self.parameters.append(.init(name: QobuzAPI.Parameters.releaseType(), value: typeString))
      
      if let sort {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.sort(), value: sort.rawValue))
      }
      
      if let order {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.order(), value: order.rawValue))
      }
      
      let filterString = filter.map({$0.rawValue}).joined(separator: ",")
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.filter(), value: filterString))
      
      
      if let limit {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
    }

    public typealias Response = QBHasMoreItems<QBArtistRelease>
    public let path: String = "artist/getReleasesList"

    public var parameters: [URLQueryItem]
  }
}
