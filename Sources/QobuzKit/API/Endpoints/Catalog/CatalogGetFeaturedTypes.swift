//
//  CatalogGetFeaturedTypes.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the different featured music types.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Returns: A QBTypes object.
   */
  public struct CatalogGetFeaturedTypes: Endpoint {
    
    public typealias Response = QBTypes

    public let path: String = "catalog/getFeaturedTypes"

    public var parameters: [URLQueryItem] = [URLQueryItem]()

  }
}
