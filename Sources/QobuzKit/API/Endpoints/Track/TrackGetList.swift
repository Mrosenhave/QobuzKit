//
//  TrackGetList.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return metadata for all tracks in the list.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter trackIds: The track IDs to fetch the metadata of.
   
   - Returns: A QBSearch object with only tracks.
  */
  public struct TrackGetList: Endpoint {
    public init(
      trackIds: Int...
    ) {
      if let encodedData = try? JSONEncoder().encode(QBTrackIds(trackIds: trackIds)) {
        self.body = encodedData
      }
    }
    public init(trackIds: [Int]) {
      if let encodedData = try? JSONEncoder().encode(QBTrackIds(trackIds: trackIds)) {
        self.body = encodedData
      }
    }

    public typealias Response = QBSearch

    public let path: String = "track/getList"

    public var parameters: [URLQueryItem] = [URLQueryItem]()
    
    public var body: Data?
  }
}
