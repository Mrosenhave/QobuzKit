//
//  Album+GetFeatured.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /// Get album recommandations by type and/or genre.
  ///  - Parameters:
  ///  - type?: The type of recommandations to fetch.
  ///  - genreId?: The genre ID to filter the recommandations by.
  ///
  ///  - Returns:
  ///  A QBItems\<QBAlbum\> object containing the reccomended albums.
  struct AlbumGetFeatured: QobuzAPI.ApiEndpoint {
    typealias Response = QBItems<QBAlbum>

    var path: String { "album/getFeatured" }

    var parameters: [String: Any] {
      [
        "type": type?.rawValue,
        "genre_id": genreId,
      ]
    }

    let type: featuredType?

    let genreId: Int?

    enum featuredType: String {
      case bestSellers = "best-sellers"
      case mostStreamed = "most-streamed"
      case newReleases = "new-releases"
      case pressAwards = "press-awards"
      case editorPicks = "editor-picks"
      case mostFeatured = "most-featured"
    }
  }
}
