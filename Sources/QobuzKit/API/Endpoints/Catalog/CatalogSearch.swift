//
//  CatalogSearch.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Searches the catalog. Sorted by relevance.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter query: The query to search for
   - Parameter type: The type of content to search for
   - Parameter limit: Maximum number of results (default: 50, max: 500)
   - Parameter offset: Offset of first result (default: 0)
   
   - Returns: A QBSearch object.
  */
  public struct CatalogSearch: Endpoint {
    public init(
      query: String,
      type: searchType? = nil,
      limit: Int? = nil,
      offset: Int? = nil
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.query(), value: query)]
      
      if let type {
        self.parameters.append(
          .init(name: QobuzAPI.Parameters.type(), value: type.rawValue)
        )
      }
      
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

    public let path: String = "catalog/search"

    public var parameters: [URLQueryItem]
    
    public enum searchType: String {
      case tracks
      case albums
      case artists
      case articles
      case playlists
      case focus
      case stories
    }
  }
}
