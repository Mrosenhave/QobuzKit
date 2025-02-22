//
//  DynamicSuggest.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Get a list of recommended tracks according to parameters given.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter postData: A QBTrackSuggestRequest object containing listened to tracks
   
   - Returns: A QBTrackSuggest object.
  */
  public struct DynamicSuggest: Endpoint {
    public init(
      postData: QBTrackSuggestRequest
    ) {
      if let encodedData = try? JSONEncoder().encode(postData) {
        self.body = encodedData
      }
    }

    public typealias Response = QBTrackSuggest

    public let path: String = "dynamic/suggest"

    public var parameters: [URLQueryItem] = [URLQueryItem]()
    
    public var body: Data?

  }
}
