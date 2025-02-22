//
//  PlaylistGetFeatured.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the list of most recent public playlists.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter type: The query type
   - Parameter tags: A tag amongst those returned by **PlaylistGetTags**
   - Parameter genreIds: genre(s) to filter the recomendations by
   
   - Returns: A QBSearch object with only playlists.
   */
  public struct PlaylistGetFeatured: Endpoint {
    public init(
      type:  featuredType,
      tags:  String...,
      genreIds: Int...
    ) {
      self.parameters = [URLQueryItem]()
      self.parameters.append(.init(name: QobuzAPI.Parameters.type(), value: type.rawValue))
      
      let tageString = tags.joined(separator: ",")
      self.parameters.append(.init(name: QobuzAPI.Parameters.tags(), value: tageString))
      
      let genreString = genreIds.map{String($0)}.joined(separator: ",")
      self.parameters.append(.init(name: QobuzAPI.Parameters.genreIds(), value: genreString))
    }
    
    
    public typealias Response = QBSearch

    public let path: String = "playlist/getFeatured"

    public var parameters: [URLQueryItem]

    public enum featuredType: String, CaseIterable {
      /// Most recent playlists created
      case lastCreated = "last-created"
      /// Most recent playlists created by Qobuz service only
      case editorPicks = "editor-picks"
    }
  }
}
