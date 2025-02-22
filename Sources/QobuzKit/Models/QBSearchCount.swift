//
//  QBSearchCount.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

public struct QBSearchCount: Codable, Hashable {
  public init(
    query: String? = nil,
    albums: QBCount,
    tracks: QBCount,
    artists: QBCount
  ) {
    self.query = query
    self.albums = albums
    self.tracks = tracks
    self.artists = artists
  }
  
    public let query: String?
    public let albums: QBCount
    public let tracks: QBCount
    public let artists: QBCount
    enum CodingKeys: String, CodingKey {
        case query
        case albums
        case tracks
        case artists
    }
}
extension QBSearchCount {
  public static func == (lhs: QBSearchCount, rhs: QBSearchCount) -> Bool {
        return lhs.query == rhs.query && lhs.albums.total == rhs.albums.total && lhs.tracks.total == rhs.tracks.total && lhs.artists.total == rhs.artists.total
    }
  public func hash(into hasher: inout Hasher) {
            hasher.combine(query)
    hasher.combine(albums.total)
    hasher.combine(tracks.total)
    hasher.combine(artists.total)
        }
}

