//
//  QBArtist.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBArtist: Codable, Hashable, QBContent, Identifiable {
    var picture: String?
    var image: QBArtistImage?
    var name: String
    var albumsCount: Int?
    var albumsAsPrimaryComposerCount: Int?
    var id: Int
    var similarArtistIds: [Int]?
    var biography: QBArtistBiography?
    var albums: QBItems<QBAlbum>?
    var favoritedAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case picture
        case image
        case name
        case albumsCount = "albums_count"
        case albumsAsPrimaryComposerCount = "albums_as_primary_composer_count"
        case id
        case similarArtistIds = "similar_artist_ids"
        case biography
        case albums
        case favoritedAt = "favorited_at"
    }
}
extension QBArtist {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: QBArtist, rhs: QBArtist) -> Bool {
        return lhs.id == rhs.id
    }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    picture = try container.decodeIfPresent(String.self, forKey: .picture)
    image = try container.decodeIfPresent(QBArtistImage.self, forKey: .image)
    name = try container.decode(String.self, forKey: .name)
    albumsCount = try container.decodeIfPresent(Int.self, forKey: .albumsCount)
    albumsAsPrimaryComposerCount = try container.decodeIfPresent(Int.self, forKey: .albumsAsPrimaryComposerCount)
    id = try container.decode(Int.self, forKey: .id)
    similarArtistIds = try container.decodeIfPresent([Int].self, forKey: .similarArtistIds)
    biography = try container.decodeIfPresent(QBArtistBiography.self, forKey: .biography)
    albums = try container.decodeIfPresent(QBItems<QBAlbum>.self, forKey: .albums)
    if let timestamp = try?  container.decodeIfPresent(Int.self, forKey: .favoritedAt) {
      favoritedAt = Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
  }

}
