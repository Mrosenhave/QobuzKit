//
//  QBArtistRelease.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - Release
struct QBArtistRelease: Codable, Hashable {
    let id, title: String
    let version: String?
//    let tracksCount: Int
    let artist: QBArtistPageArtist
//    let artists: [ArtistElement]
    let image: QBImages
//    let label: Label
//    let genre: Genre
    let releaseType: QBReleaseType
//    let releaseTags: [String]
    let duration: Int
    let dates: QBDates
    let parentalWarning: Bool
//    let audioInfo: AudioInfo
//    let rights: LastReleaseRights
//    let description: String?

    enum CodingKeys: String, CodingKey {
        case id, title, version
        case image
//        case tracksCount = "tracks_count"
        case artist/*, artists, image, label, genre*/
        case releaseType = "release_type"
//        case releaseTags = "release_tags"
        case duration, dates
        case parentalWarning = "parental_warning"
//        case audioInfo = "audio_info"
//        case rights, description
    }
}
extension QBArtistRelease {
    static func == (lhs: QBArtistRelease, rhs: QBArtistRelease) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
