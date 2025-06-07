//
//  QBDiscoverType.swift
//  QoRipMobile
//
//  Created by Markus Rosenhave on 03/02/2024.
//

import Foundation

public enum QBDiscoverType: String, Codable {
    case banners
    case newReleases
    case recentReleases
    case qobuzissims
    case idealDiscography
    case albumOfTheWeek
    case mostStreamed
    case pressAwards
    case playlists
    case playlistsTags
    
    public func callAsFunction() -> String {
        return self.rawValue
    }
  public func title() -> String {
      switch self {
      case .banners:
          return "Banners"
      case .newReleases:
          return "New Releases"
      case .recentReleases:
          return "Recent Releases"
      case .qobuzissims:
          return "Qobuzissims"
      case .idealDiscography:
          return "Ideal Discography"
      case .albumOfTheWeek:
          return "Albums of the Week"
      case .mostStreamed:
          return "Most Streamed"
      case .pressAwards:
          return "Press Awards"
      case .playlists:
          return "Playlists"
      case .playlistsTags:
          return "Playlist Tags"
      }
  }
  
}
