//
//  Search.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

extension QobuzAPI.Endpoints {
  struct Search: QobuzAPI.ApiEndpoint {
    typealias Response = QBSearch
    
    var path: String {"catalog/search"}
    
    var method: QobuzAPI.HTTPMethod {.get}
    
    var requiresAuth: Bool {false}
    
    var parameters: [String : Any] {["query":query, "type":type?.rawValue]}
    
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

