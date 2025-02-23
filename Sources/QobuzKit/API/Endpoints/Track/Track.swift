//
//  Track.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the metadata for a track.
   
   Note: Tracks provided in the Album endpoint has the same metadata
   
   To know if a track could be streamed by a user, you only have to consider the fied : `streamable`. The field
   `streamable` is a match form the user credentials and the availability of the product. This is a real time
   information. A `true` state means user will be able to stream the product, thanks to his credentials and the track availability
   for streaming.
   
   `PurchasableAt` / `StreamableAt` indicates you when a product will start to be able to download and
   stream. It could be `nil` when we do not have rights on it. It is only making reference to the product.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter trackId: The track ID to fetch the metadata of.
   
   - Returns: A QBTrack object.
  */
  public struct Track: Endpoint {
    public init(
      trackId: Int
    ) {
      self.parameters = [
        .init(name: QobuzAPI.Parameters.trackId(), value: String(trackId))
      ]
      
    }

    public typealias Response = QBTrack

    public let path: String = "track/get"

    public var parameters: [URLQueryItem]
  }
}
