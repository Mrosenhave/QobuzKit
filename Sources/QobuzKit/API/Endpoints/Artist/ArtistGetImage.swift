//
//  ArtistGetImage.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 24/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
  Return the images for a list of artists
   
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter artistIds: Id(s) of the desired artist
   
   - Returns: An array of QBArtistImageHashFormat
  */
  public struct ArtistGetImage: Endpoint {
    public init(artistIds: Int...) {
      self.parameters = [URLQueryItem]()
      let postData = QBArtistIds(artistIds: artistIds)
      if let encodedData = try? JSONEncoder().encode(postData) {
        self.body = encodedData
      }
    }

    public typealias Response = [QBArtistImageHashFormat]

    public let path: String = "artist/getImage"

    public var parameters: [URLQueryItem]
    
    public var body: Data?

  }
}
