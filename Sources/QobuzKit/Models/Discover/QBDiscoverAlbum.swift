//
//  QBDiscoverAlbums.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

struct QBDiscoverAlbum: Codable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: QBDiscoverAlbum, rhs: QBDiscoverAlbum) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id, title: String
    let version: String?
    let trackCount, duration: Int
    let parentalWarning: Bool
    let image: QBImages
    let artists: [QBPerformer]
    let label: QBLabel
    let genre: QBGenre
    let dates: QBDates
    let awards: [QBAward]
    let audioInfo: QBAudioInfo
    let rights: QBRights

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
