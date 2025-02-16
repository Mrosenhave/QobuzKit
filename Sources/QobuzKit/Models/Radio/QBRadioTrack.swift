//
//  QBRadioTrack.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - Item
struct QBRadioTrack: Codable {
    let id: Int
    let title: String
    let version: String?
    let isrc: String
    let duration: Int
    let parentalWarning: Bool
//    let physicalSupport: PhysicalSupport
    let audioInfo: QBAudioInfo
    let rights: QBRights
    let artists: [QBPerformer]
    let composer: QBLabel?
    let album: QBRadioAlbum

    enum CodingKeys: String, CodingKey {
        case id, title, version, isrc, duration
        case parentalWarning = "parental_warning"
//        case physicalSupport = "physical_support"
        case audioInfo = "audio_info"
        case rights, artists, composer, album
    }
}
