//
//  Genre.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Get details for a genre of music.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter genreId: The genre id
   
   - Returns: A QBGenre object.
  */
  public struct Genre: Endpoint {
    public init(
      genreId: Int
    ) {
      self.parameters = [
        .init(name: QobuzAPI.Parameters.genreId(), value: String(genreId))
      ]
      
    }

    public typealias Response = QBGenre

    public let path: String = "genre/get"

    public var parameters: [URLQueryItem]
  }
}
