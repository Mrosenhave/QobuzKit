//
//  QBArtist.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBArtist: Codable, Hashable, QBContent, Identifiable {
  public init(picture: String? = nil, image: QBArtistImage? = nil, name: String, albumsCount: Int? = nil, albumsAsPrimaryComposerCount: Int? = nil, id: Int, similarArtistIds: [Int]? = nil, biography: QBArtistBiography? = nil, albums: QBItems<QBAlbum>? = nil, favoritedAt: Date? = nil) {
    self.picture = picture
    self.image = image
    self.name = name
    self.albumsCount = albumsCount
    self.albumsAsPrimaryComposerCount = albumsAsPrimaryComposerCount
    self.id = id
    self.similarArtistIds = similarArtistIds
    self.biography = biography
    self.albums = albums
    self.favoritedAt = favoritedAt
  }
  
    public var picture: String?
    public var image: QBArtistImage?
    public var name: String
    public var albumsCount: Int?
    public var albumsAsPrimaryComposerCount: Int?
    public var id: Int
    public var similarArtistIds: [Int]?
    public var biography: QBArtistBiography?
    public var albums: QBItems<QBAlbum>?
    public var favoritedAt: Date?
    
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
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: QBArtist, rhs: QBArtist) -> Bool {
        return lhs.id == rhs.id
    }
  public init(from decoder: Decoder) throws {
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
