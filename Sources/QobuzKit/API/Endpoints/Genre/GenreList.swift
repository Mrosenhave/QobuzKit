//
//  GenreList.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Lists all the sub-genres of a parent genre of music. If parent_id is omitted, all the root level genres are
   returned.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter parentId: The id of the genre to request sub-genres for
   - Parameter limit: Maximum number of genres (default: 25, max: 100)
   - Parameter offset: Offset of the first genre (default: 0)
   
   - Returns: A QBGenreList object.
  */
  public struct GenreList: Endpoint {
    public init(
      parentId: Int,
      limit: Int? = nil,
      offset: Int? = nil
    ) {
      self.parameters = [
        .init(name: QobuzAPI.Parameters.parentId(), value: String(parentId))
      ]
      if let limit {
        self.parameters.append(.init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(.init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
      
    }

    public typealias Response = QBGenreList

    public let path: String = "genre/list"

    public var parameters: [URLQueryItem]
  }
}
