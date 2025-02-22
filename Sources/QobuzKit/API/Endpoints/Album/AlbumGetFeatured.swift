//
//  AlbumGetFeatured.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return album recommendations by type and/or genre
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter type: Type of recommendation
   - Parameter genreIds: genre(s) to filter the recomendations by
   - Parameter limit: Maximum number of recomended albums (default: 25, max: 500)
   - Parameter offset: Offset of first album (default: 0)
   - Parameter supplierId: The supplier ID
   
   - Returns: A QBSearch object with only the albums section.
   */
  public struct AlbumGetFeatured: Endpoint {
    public init(type:  featuredType, genreIds: Int..., limit: Int? = nil, offset: Int? = nil, supplierId: String? = nil) {
      self.parameters = [URLQueryItem]()
      self.parameters.append(.init(name: QobuzAPI.Parameters.type(), value: type.rawValue))
      
      if !genreIds.isEmpty {
        if genreIds.count == 1, let genreId = genreIds.first {
          let genreString = String(genreId)
          self.parameters.append(.init(name: QobuzAPI.Parameters.genreId(), value: genreString))
        } else {
          let genreString = genreIds.map{String($0)}.joined(separator: ",")
          self.parameters.append(.init(name: QobuzAPI.Parameters.genreIds(), value: genreString))
        }
      }
      
      if let limit {
        self.parameters.append(.init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(.init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
      if let supplierId {
        self.parameters.append(.init(name: QobuzAPI.Parameters.supplierId(), value: supplierId))
      }
    }
    
    
    public typealias Response = QBSearch

    public let path: String = "album/getFeatured"

    public var parameters: [URLQueryItem]

    public enum featuredType: String, CaseIterable {
      case mostStreamed = "most-streamed"
      case bestSellers = "best-sellers"
      case newReleases = "new-releases"
      case pressAwards = "press-awards"
      case editorPicks = "editor-picks"
      case mostFeatured = "most-featured"
      case harmoniaMundi = "harmonia-mundi"
      case universalClassic = "universal-classic"
      case universalJazz = "universal-jazz"
      case universalJeunesse = "universal-jeunesse"
      case universalChanson = "universal-chanson"
      case newReleasesFull = "new-releases-full"
      case recentReleases = "recent-releases"
      case idealDiscography = "ideal-discography"
      case qobuzissims = "qobuzissims"
      //These are invalid:
//      case albumOfTheWeek = "album-of-the-week"
//      case reReleaseOfTheWeek = "re-release-of-the-week"
    }
  }
}

