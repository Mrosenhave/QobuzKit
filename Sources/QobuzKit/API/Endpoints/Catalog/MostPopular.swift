//
//  MostPopular.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   In a search, returns the 30 first most popular results (mix artists, albums and tracks).
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter query: The query to search for
   
   - Returns: A QBSearch object with only the query and mostPopular section.
  */
  public struct MostPopular: Endpoint {
    public init(
      query: String
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.query(), value: query)]
    }

    public typealias Response = QBSearch

    public let path: String = "most-popular/get"

    public var parameters: [URLQueryItem]

  }
}
