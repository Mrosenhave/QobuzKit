//
//  StorySearch.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 27/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Searches the stories catalog.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter query: The query to search for
   - Parameter limit: Maximum number of results (default: 50, max: 500)
   - Parameter offset: Offset of first result (default: 0)
   
   - Returns: A QBSearch object with query and stories.
  */
  public struct StorySearch: Endpoint {
    public init(
      query: String,
      limit: Int? = nil,
      offset: Int? = nil
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.query(), value: query)]
      
      if let limit {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.limit(), value: String(limit))
        )
      }
      
      if let offset {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.offset(), value: String(offset))
        )
      }
    }

    public typealias Response = QBSearch

    public let path: String = "story/search"

    public var parameters: [URLQueryItem]
  }
}
