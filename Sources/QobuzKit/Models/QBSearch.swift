//
//  QBAlbum.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBSearch: Codable, Hashable {
    let query: String?
    let albums: QBItems<QBAlbum>?
    let tracks: QBItems<QBTrack>?
    let artists: QBItems<QBArtist>?
    let playlists: QBItems<QBPlaylist>?
    let mostPopular: QBItems<QBTypeContent>?
    enum CodingKeys: String, CodingKey {
        case query
        case albums
        case tracks
        case artists
        case playlists
        case mostPopular = "most_popular"
    }
}
extension QBSearch {
    static func == (lhs: QBSearch, rhs: QBSearch) -> Bool {
        return lhs.query == rhs.query && lhs.albums?.offset == rhs.albums?.offset && lhs.tracks?.offset == rhs.tracks?.offset && lhs.artists?.offset == rhs.artists?.offset && lhs.playlists?.offset == rhs.playlists?.offset
    }
    func hash(into hasher: inout Hasher) {
            hasher.combine(query)
            hasher.combine(albums?.offset)
            hasher.combine(tracks?.offset)
            hasher.combine(artists?.offset)
            hasher.combine(playlists?.offset)
        }
}

