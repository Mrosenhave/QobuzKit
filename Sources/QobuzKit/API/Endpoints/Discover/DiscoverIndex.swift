//
//  DiscoverIndex.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 27/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Get the discover home page
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter genreID: The genre id
   
   - Returns: A QBDiscover object.
  */
  public struct DiscoverIndex: Endpoint {
    public init(
      genreIds: Int...
    ) {
      self.parameters = [
        .init(name: QobuzAPI.Parameters.genreId(), value: genreIds.map({String($0)}).joined(separator: ","))
      ]
    }

    public typealias Response = QBDiscover

    public let path: String = "discover/index"

    public var parameters: [URLQueryItem]

    public enum favoriteType: String {
      case album
      case track
      case artist
      case article
    }
  }
}
