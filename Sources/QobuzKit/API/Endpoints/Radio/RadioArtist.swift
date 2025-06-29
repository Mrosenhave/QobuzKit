//
//  RadioArtist.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 20/06/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return radio station for an artist.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter artistId: Id of the desired artist to get the radio of
   
   - Returns: A QBRadio object.
  */
  public struct RadioArtist: Endpoint {
    public init(artistId: Int) {
      self.parameters = [.init(name: QobuzAPI.Parameters.artistId(), value: String(artistId))]
    }

    public typealias Response = QBRadio

    public let path: String = "radio/artist"

    public var parameters: [URLQueryItem]

  }
}
