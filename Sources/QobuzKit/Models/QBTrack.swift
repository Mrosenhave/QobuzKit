//
//  QBTrack.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBTrack: Codable, Hashable, QBContent {
    static func == (lhs: QBTrack, rhs: QBTrack) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let maximumBitDepth: Int
    let copyright: String?
    let performers: [QBCreditsPerformer]?
    let audioInfo: QBAudioInfo
    let performer: QBPerformer?
    let album: QBAlbum?
    let isrc: String
    let title: String
    let version: String?
    let duration: Int
    let parentalWarning: Bool
    let trackNumber: Int? // does not appear in WeeklyQ
    let maximumChannelCount: Int
    let id: Int
    let maximumSamplingRate: Double
    let releaseDateOriginal: String?
    let purchasable: Bool
    let streamable: Bool
    let previewable: Bool
    let sampleable: Bool
    let downloadable: Bool
    let streamableAt: Int?
    let hires: Bool
    let hiresStreamable: Bool
    var favoritedAt: Int?
    var position: Int?
    var playlistTrackId: Int?
    
    enum CodingKeys: String, CodingKey {
        case maximumBitDepth = "maximum_bit_depth"
        case copyright
        case performers
        case audioInfo = "audio_info"
        case performer
        case album
        case isrc
        case title
        case version
        case duration
        case parentalWarning = "parental_warning"
        case trackNumber = "track_number"
        case maximumChannelCount = "maximum_channel_count"
        case id
        case maximumSamplingRate = "maximum_sampling_rate"
        case releaseDateOriginal = "release_date_original"
        case purchasable
        case streamable
        case previewable
        case sampleable
        case downloadable
        case streamableAt = "streamable_at"
        case hires
        case hiresStreamable = "hires_streamable"
        case favoritedAt = "favorited_at"
        case position
        case playlistTrackId = "playlist_track_id"
    }
}

extension QBTrack {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        maximumBitDepth = try container.decode(Int.self, forKey: .maximumBitDepth)
        copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        // Decode performers
        if let performersString = try? container.decodeIfPresent(String.self, forKey: .performers) {
            performers = parsePerformers(from: performersString)
        } else {
            performers = nil
        }
        audioInfo = try container.decode(QBAudioInfo.self, forKey: .audioInfo)
        performer = try container.decodeIfPresent(QBPerformer.self, forKey: .performer)
        album = try container.decodeIfPresent(QBAlbum.self, forKey: .album)
        isrc = try container.decode(String.self, forKey: .isrc)
        title = try container.decode(String.self, forKey: .title).trimmingCharacters(in: .whitespaces)
        version = try container.decodeIfPresent(String.self, forKey: .version)?.trimmingCharacters(in: .whitespaces)
        duration = try container.decode(Int.self, forKey: .duration)
        parentalWarning = try container.decode(Bool.self, forKey: .parentalWarning)
        trackNumber = try container.decodeIfPresent(Int.self, forKey: .trackNumber)
        maximumChannelCount = try container.decode(Int.self, forKey: .maximumChannelCount)
        id = try container.decode(Int.self, forKey: .id)
        maximumSamplingRate = try container.decode(Double.self, forKey: .maximumSamplingRate)
        releaseDateOriginal = try container.decodeIfPresent(String.self, forKey: .releaseDateOriginal)
        purchasable = try container.decode(Bool.self, forKey: .purchasable)
        streamable = try container.decode(Bool.self, forKey: .streamable)
        previewable = try container.decode(Bool.self, forKey: .previewable)
        sampleable = try container.decode(Bool.self, forKey: .sampleable)
        downloadable = try container.decode(Bool.self, forKey: .downloadable)
        streamableAt = try container.decodeIfPresent(Int.self, forKey: .streamableAt)
        hires = try container.decode(Bool.self, forKey: .hires)
        hiresStreamable = try container.decode(Bool.self, forKey: .hiresStreamable)
        favoritedAt = try container.decodeIfPresent(Int.self, forKey: .favoritedAt)
        position = try container.decodeIfPresent(Int.self, forKey: .position)
        playlistTrackId = try container.decodeIfPresent(Int.self, forKey: .playlistTrackId)
    }
}
