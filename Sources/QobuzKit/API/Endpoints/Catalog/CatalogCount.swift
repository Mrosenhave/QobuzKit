//
//  CatalogCount.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Search for objects, may it be tracks, albums or artists, by name. Return the number of matches only.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter query: The query to search for
   
   - Returns: A QBSearchCount object.
  */
  public struct CatalogCount: Endpoint {
    public init(
      query: String
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.query(), value: query)]
    }

    public typealias Response = QBSearchCount

    public let path: String = "catalog/count"

    public var parameters: [URLQueryItem]

  }
}
