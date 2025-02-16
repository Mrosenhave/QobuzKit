//
//  QBArtistTopTrack.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - TopTrack
struct QBArtistTopTrack: Codable, Hashable {
    internal init(id: Int, title: String, version: String? = nil, artist: QBArtistPageArtist, album: QBArtistTopTrackAlbum, duration: Int, parentalWarning: Bool) {
        self.id = id
        self.title = title.trimmingCharacters(in: .whitespaces)
        self.version = version?.trimmingCharacters(in: .whitespaces)
        self.album = album
        self.artist = artist
        self.duration = duration
        self.parentalWarning = parentalWarning
    }
    
    let id: Int
    let title: String
    let version: String?
    let artist: QBArtistPageArtist?
    let album: QBArtistTopTrackAlbum
    let duration: Int
    let parentalWarning: Bool
    
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
    static func == (lhs: QBArtistTopTrack, rhs: QBArtistTopTrack) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
// MARK: - TopTrack
struct QBArtistTopTrackAlbum: Codable, Hashable {
    internal init(id: String, title: String, version: String? = nil, image: QBImages) {
        self.id = id
        self.title = title.trimmingCharacters(in: .whitespaces)
        self.version = version?.trimmingCharacters(in: .whitespaces)
        self.image = image
    }
    
    let id: String
    let title: String
    let version: String?
    let image: QBImages
    
    enum CodingKeys: String, CodingKey {
            case id
            case title
            case version
            case image
        }
}

extension QBArtistTopTrackAlbum {
    static func == (lhs: QBArtistTopTrackAlbum, rhs: QBArtistTopTrackAlbum) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}
