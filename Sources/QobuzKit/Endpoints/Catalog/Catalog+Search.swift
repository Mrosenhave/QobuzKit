//
//  Search.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /// Searches the entire Qobuz catalog
  ///  - Parameters:
  ///  - query: The query to search for
  ///  - type?: The type of items to fetch.
  ///
  ///  - Returns:
  ///  a QBSearch object containing the search results
  struct Search: QobuzAPI.ApiEndpoint {
    typealias Response = QBSearch

    var path: String { "catalog/search" }

    var method: QobuzAPI.HTTPMethod { .get }

    var requiresAuth: Bool { false }

    var parameters: [String: Any] { ["query": query, "type": type?.rawValue] }

    var body: Data? { nil }

    let query: String

    let type: SearchType?

    enum SearchType: String {
      case tracks
      case albums
      case artists
      case articles
      case playlists
      case focus
    }
  }
}
