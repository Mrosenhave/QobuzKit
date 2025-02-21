//
//  QBTrack.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBTrack: Codable, Hashable, QBContent {
  public init(maximumBitDepth: Int, copyright: String? = nil, performers: [String: [String]]? = nil, audioInfo: QBAudioInfo, performer: QBPerformer? = nil, album: QBAlbum? = nil, isrc: String, title: String, version: String? = nil, duration: Int, parentalWarning: Bool, trackNumber: Int? = nil, maximumChannelCount: Int, id: Int, maximumSamplingRate: Double, releaseDateOriginal: String? = nil, purchasable: Bool, streamable: Bool, previewable: Bool, sampleable: Bool, downloadable: Bool, streamableAt: Int? = nil, hires: Bool, hiresStreamable: Bool, favoritedAt: Int? = nil, position: Int? = nil, playlistTrackId: Int? = nil) {
    self.maximumBitDepth = maximumBitDepth
    self.copyright = copyright
    self.performers = performers
    self.audioInfo = audioInfo
    self.performer = performer
    self.album = album
    self.isrc = isrc
    self.title = title
    self.version = version
    self.duration = duration
    self.parentalWarning = parentalWarning
    self.trackNumber = trackNumber
    self.maximumChannelCount = maximumChannelCount
    self.id = id
    self.maximumSamplingRate = maximumSamplingRate
    self.releaseDateOriginal = releaseDateOriginal
    self.purchasable = purchasable
    self.streamable = streamable
    self.previewable = previewable
    self.sampleable = sampleable
    self.downloadable = downloadable
    self.streamableAt = streamableAt
    self.hires = hires
    self.hiresStreamable = hiresStreamable
    self.favoritedAt = favoritedAt
    self.position = position
    self.playlistTrackId = playlistTrackId
  }
  
  public static func == (lhs: QBTrack, rhs: QBTrack) -> Bool {
        return lhs.id == rhs.id
    }
    
  public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public let maximumBitDepth: Int
    public let copyright: String?
  public let performers: [String: [String]]?
    public let audioInfo: QBAudioInfo
    public let performer: QBPerformer?
    public let album: QBAlbum?
    public let isrc: String
    public let title: String
    public let version: String?
    public let duration: Int
    public let parentalWarning: Bool
    public let trackNumber: Int? // does not appear in WeeklyQ
    public let maximumChannelCount: Int
    public let id: Int
    public let maximumSamplingRate: Double
    public let releaseDateOriginal: String?
    public let purchasable: Bool
    public let streamable: Bool
    public let previewable: Bool
    public let sampleable: Bool
    public let downloadable: Bool
    public let streamableAt: Int?
    public let hires: Bool
    public let hiresStreamable: Bool
    public var favoritedAt: Int?
    public var position: Int?
    public var playlistTrackId: Int?
    
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
    public init(from decoder: Decoder) throws {
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
