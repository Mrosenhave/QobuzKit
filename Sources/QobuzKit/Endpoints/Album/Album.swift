//
//  Album.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /// Return metadata about the specified album and its tracks.
  /// Tracks that the user can stream have its `streamable` flag set to true.
  /// `purchasableAt` and `streamableAt` marks when the product will become available.
  ///  - Parameters:
  ///  - albumId: The id of the album to get information about.
  ///
  ///  - Returns:
  ///  A QBAlbum object containing the album information.
  struct Album: QobuzAPI.ApiEndpoint {
    typealias Response = QBAlbum

    var path: String { "album/get" }

    var parameters: [String: Any] { ["album_id": albumId] }

    let albumId: String

  }
}
