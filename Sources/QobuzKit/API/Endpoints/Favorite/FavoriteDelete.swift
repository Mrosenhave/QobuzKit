//
//  FavoriteDelete.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Delete favorites
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter albumIds: album ids to remove as favorite
   - Parameter articleIds: article  ids to remove as favorite   
   - Parameter artistIds: artist ids to remove as favorite
   - Parameter trackIds: track ids to remove as favorite
   
   - Returns: A QBStatus object.
  */
  public struct FavoriteDelete: Endpoint {
    public init(
      albumIds: String...,
      articleIds: String...,
      artistIds: Int...,
      trackIds: Int...
    ) {
      self.parameters = [URLQueryItem]()
      if !albumIds.isEmpty {
        let string = albumIds.joined(separator: ",")
        self.parameters.append(.init(name: QobuzAPI.Parameters.albumIds(), value: string))
      }
      if !articleIds.isEmpty {
        let string = articleIds.joined(separator: ",")
        self.parameters.append(.init(name: QobuzAPI.Parameters.articleIds(), value: string))
      }
      if !artistIds.isEmpty {
        let string = artistIds.map({String($0)}).joined(separator: ",")
        self.parameters.append(.init(name: QobuzAPI.Parameters.artistIds(), value: string))
      }
      if !trackIds.isEmpty {
        let string = trackIds.map({String($0)}).joined(separator: ",")
        self.parameters.append(.init(name: QobuzAPI.Parameters.trackIds(), value: string))
      }
    }

    public typealias Response = QBStatus

    public let path: String = "favorite/delete"

    public var parameters: [URLQueryItem]

  }
}
