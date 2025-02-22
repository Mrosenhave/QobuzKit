//
//  DynamicTracks.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Get a list of available dynamic track list.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter type: Type of dynamic list
   
   - Returns: A QBWeeklyQ object.
  */
  public struct DynamicTracks: Endpoint {
    public init(
      type: DynamicTracksType
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.type(), value: type.rawValue)]
    }

    public typealias Response = QBWeeklyQ

    public let path: String = "dynamic-tracks/get"

    public var parameters: [URLQueryItem] = [URLQueryItem]()
    
    public enum DynamicTracksType: String, CaseIterable {
      case weekly
    }
  }
}
