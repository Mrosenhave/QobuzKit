//
//  CatalogGetFeatured.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return recommendations, with ability to filter by type and/or genre.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter type: Type of recommendation
   - Parameter genreIds: genre(s) to filter the recomendations by
   - Parameter limit: Maximum number of recomended items (default: 25, max: 100)
   - Parameter offset: Offset of first item (default: 0)
   
   - Returns: A QBSearch object without query.
   */
  public struct CatalogGetFeatured: Endpoint {
    public init(type:  featuredType, genreIds: Int..., limit: Int? = nil, offset: Int? = nil) {
      self.parameters = [URLQueryItem]()
      self.parameters.append(.init(name: QobuzAPI.Parameters.type(), value: type.rawValue))
      
      if !genreIds.isEmpty {
        let genreString = genreIds.map{String($0)}.joined(separator: ",")
        self.parameters.append(.init(name: QobuzAPI.Parameters.genreIds(), value: genreString))
      }
      
      if let limit {
        self.parameters.append(.init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(.init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
    }
    
    
    public typealias Response = QBSearch

    public let path: String = "catalog/getFeatured"

    public var parameters: [URLQueryItem]

    public enum featuredType: String, CaseIterable {
      case albums
      case artists
      case playlists
      case articles
    }
  }
}
