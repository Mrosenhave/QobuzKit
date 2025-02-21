//
//  QBArtistRelease.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - Release
public struct QBArtistRelease: Codable, Hashable {
    public let id, title: String
    public let version: String?
//    public let tracksCount: Int
    public let artist: QBArtistPageArtist
//    public let artists: [ArtistElement]
    public let image: QBImages
//    public let label: Label
//    public let genre: Genre
    public let releaseType: QBReleaseType
//    public let releaseTags: [String]
    public let duration: Int
    public let dates: QBDates
    public let parentalWarning: Bool
//    public let audioInfo: AudioInfo
//    public let rights: LastReleaseRights
//    public let description: String?

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
  public static func == (lhs: QBArtistRelease, rhs: QBArtistRelease) -> Bool {
        return lhs.id == rhs.id
    }
  public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
