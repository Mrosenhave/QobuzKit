//
//  QBRadioTrack.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - Item
public struct QBRadioTrack: Codable {
    public let id: Int
    public let title: String
    public let version: String?
    public let isrc: String
    public let duration: Int
    public let parentalWarning: Bool
//    public let physicalSupport: PhysicalSupport
    public let audioInfo: QBAudioInfo
    public let rights: QBRights
    public let artists: [QBPerformer]
    public let composer: QBLabel?
    public let album: QBRadioAlbum

    enum CodingKeys: String, CodingKey {
        case id, title, version, isrc, duration
        case parentalWarning = "parental_warning"
//        case physicalSupport = "physical_support"
        case audioInfo = "audio_info"
        case rights, artists, composer, album
    }
}
