//
//  QBArtistTopTrack.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - TopTrack
public struct QBArtistTopTrack: Codable, Hashable {
    public init(id: Int, title: String, version: String? = nil, artist: QBArtistPageArtist, album: QBArtistTopTrackAlbum, duration: Int, parentalWarning: Bool) {
        self.id = id
        self.title = title.trimmingCharacters(in: .whitespaces)
        self.version = version?.trimmingCharacters(in: .whitespaces)
        self.album = album
        self.artist = artist
        self.duration = duration
        self.parentalWarning = parentalWarning
    }
    
    public let id: Int
    public let title: String
    public let version: String?
    public let artist: QBArtistPageArtist?
    public let album: QBArtistTopTrackAlbum
    public let duration: Int
    public let parentalWarning: Bool
    
    enum CodingKeys: String, CodingKey {
            case id
            case title
            case version
            case artist
            case album
            case duration
            case parentalWarning = "parental_warning"
        }
}
extension QBArtistTopTrack {
    public static func == (lhs: QBArtistTopTrack, rhs: QBArtistTopTrack) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
// MARK: - TopTrack
public struct QBArtistTopTrackAlbum: Codable, Hashable {
    public init(id: String, title: String, version: String? = nil, image: QBImages) {
        self.id = id
        self.title = title.trimmingCharacters(in: .whitespaces)
        self.version = version?.trimmingCharacters(in: .whitespaces)
        self.image = image
    }
    
    public let id: String
    public let title: String
    public let version: String?
    public let image: QBImages
    
    enum CodingKeys: String, CodingKey {
            case id
            case title
            case version
            case image
        }
}

extension QBArtistTopTrackAlbum {
    public static func == (lhs: QBArtistTopTrackAlbum, rhs: QBArtistTopTrackAlbum) -> Bool {
        return lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}
