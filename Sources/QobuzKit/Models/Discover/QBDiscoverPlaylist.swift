//
//  QBDiscoverPlaylist.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

struct QBDiscoverPlaylist: Codable {
    let id: Int
    let name: String
    let owner: QBArtist
    let image: QBRectangleImage
    let description: String
    let duration, tracksCount: Int
    let genres: [QBGenre]

    enum CodingKeys: String, CodingKey {
        case id, name, owner, image, description, duration
        case tracksCount = "tracks_count"
        case genres
    }
}
