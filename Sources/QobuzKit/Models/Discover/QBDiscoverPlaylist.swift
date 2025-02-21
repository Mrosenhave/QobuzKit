//
//  QBDiscoverPlaylist.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public struct QBDiscoverPlaylist: Codable {
    public let id: Int
    public let name: String
    public let owner: QBArtist
    public let image: QBRectangleImage
    public let description: String
    public let duration, tracksCount: Int
    public let genres: [QBGenre]

    enum CodingKeys: String, CodingKey {
        case id, name, owner, image, description, duration
        case tracksCount = "tracks_count"
        case genres
    }
}
