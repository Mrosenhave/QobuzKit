//
//  QBAlbum.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBSearch: Codable, Hashable {
  public init(query: String? = nil, albums: QBItems<QBAlbum>? = nil, tracks: QBItems<QBTrack>? = nil, artists: QBItems<QBArtist>? = nil, playlists: QBItems<QBPlaylist>? = nil, stories: QBItems<QBStory>? = nil, mostPopular: QBItems<QBTypeContent>? = nil) {
    self.query = query
    self.albums = albums
    self.tracks = tracks
    self.artists = artists
    self.playlists = playlists
    self.stories = stories
    self.mostPopular = mostPopular
  }
  
    public let query: String?
    public let albums: QBItems<QBAlbum>?
    public let tracks: QBItems<QBTrack>?
    public let artists: QBItems<QBArtist>?
    public let playlists: QBItems<QBPlaylist>?
    public let stories: QBItems<QBStory>?
    public let mostPopular: QBItems<QBTypeContent>?
    enum CodingKeys: String, CodingKey {
        case query
        case albums
        case tracks
        case artists
        case playlists
        case stories
        case mostPopular = "most_popular"
    }
}
extension QBSearch {
  public static func == (lhs: QBSearch, rhs: QBSearch) -> Bool {
        return lhs.query == rhs.query && lhs.albums?.offset == rhs.albums?.offset && lhs.tracks?.offset == rhs.tracks?.offset && lhs.artists?.offset == rhs.artists?.offset && lhs.playlists?.offset == rhs.playlists?.offset
    }
  public func hash(into hasher: inout Hasher) {
            hasher.combine(query)
            hasher.combine(albums?.offset)
            hasher.combine(tracks?.offset)
            hasher.combine(artists?.offset)
            hasher.combine(playlists?.offset)
        }
}

