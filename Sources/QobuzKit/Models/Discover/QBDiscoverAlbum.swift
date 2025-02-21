//
//  QBDiscoverAlbums.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public struct QBDiscoverAlbum: Codable, Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
  public static func == (lhs: QBDiscoverAlbum, rhs: QBDiscoverAlbum) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let id, title: String
    public let version: String?
    public let trackCount, duration: Int
    public let parentalWarning: Bool
    public let image: QBImages
    public let artists: [QBPerformer]
    public let label: QBLabel
    public let genre: QBGenre
    public let dates: QBDates
    public let awards: [QBAward]
    public let audioInfo: QBAudioInfo
    public let rights: QBRights

    enum CodingKeys: String, CodingKey {
        case id, title, version
        case trackCount = "track_count"
        case duration
        case parentalWarning = "parental_warning"
        case image, artists, label, genre, dates, awards
        case audioInfo = "audio_info"
        case rights
    }
}
