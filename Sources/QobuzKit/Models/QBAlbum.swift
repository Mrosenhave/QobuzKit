//
//  QBAlbum.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBAlbum: Codable, Hashable, QBContent, Identifiable {
  public init(image: QBImages, mediaCount: Int? = nil, artist: QBArtist? = nil, artists: [QBPerformer]? = nil, label: QBLabel, title: String, qobuzId: Int? = nil, version: String? = nil, url: URL? = nil, duration: Int? = nil, parentalWarning: Bool? = nil, tracksCount: Int? = nil, genre: QBGenre, id: String, rights: QBRights, awards: [QBAward]? = nil, audioInfo: QBAudioInfo, albumDescription: String? = nil, copyright: String? = nil, maximumTechnicalSpecifications: String? = nil, trackIds: [Int]? = nil, dates: QBDates, tracks: QBItems<QBTrack>? = nil, albumsFromSameArtist: QBItems<QBAlbum>? = nil, favoritedAt: Date? = nil) {
    self.image = image
    self.mediaCount = mediaCount
    self.artist = artist
    self.artists = artists
    self.label = label
    self.title = title
    self.qobuzId = qobuzId
    self.version = version
    self.url = url
    self.duration = duration
    self.parentalWarning = parentalWarning
    self.tracksCount = tracksCount
    self.genre = genre
    self.id = id
    self.rights = rights
    self.awards = awards
    self.audioInfo = audioInfo
    self.albumDescription = albumDescription
    self.copyright = copyright
    self.maximumTechnicalSpecifications = maximumTechnicalSpecifications
    self.trackIds = trackIds
    self.dates = dates
    self.tracks = tracks
    self.albumsFromSameArtist = albumsFromSameArtist
    self.favoritedAt = favoritedAt
  }
  
  
  public static func == (lhs: QBAlbum, rhs: QBAlbum) -> Bool {
    return lhs.id == rhs.id && lhs.trackIds == rhs.trackIds && lhs.tracks?.items == rhs.tracks?.items
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  
  //    public var maximumBitDepth: Int?
  public var image: QBImages
  public var mediaCount: Int? // does not appear in weeklyQ
  public var artist: QBArtist?
  public var artists: [QBPerformer]?
  public let label: QBLabel
  //    public var releasedAt: Date
  public var title: String
  public var qobuzId: Int?
  public var version: String?
  public var url: URL?
  public var duration: Int? // does not appear in weeklyQ
  public var parentalWarning: Bool? // does not appear in weeklyQ
  public var tracksCount: Int? // does not appear in weeklyQ
  public var genre: QBGenre
  //    public var maximumChannelCount: Int
  //    public var maximumSamplingRate: Double
  public var id: String
  //    public var purchasable: Bool
  //    public var streamable: Bool
  //    public var previewable: Bool
  //    public var sampleable: Bool
  //    public var downloadable: Bool
  //    public var streamableAt: Int?
  //    public var hires: Bool
  //    public var hiresStreamable: Bool
  public let rights: QBRights
  public let awards: [QBAward]?
  public let audioInfo: QBAudioInfo
  public var albumDescription: String?
  public var copyright: String?
  public var maximumTechnicalSpecifications: String?
  public var trackIds: [Int]?
  public var dates: QBDates
  public var tracks: QBItems<QBTrack>?
  public var albumsFromSameArtist: QBItems<QBAlbum>?
  public var favoritedAt: Date?
  
  enum CodingKeys: String, CodingKey {
    case maximumBitDepth = "maximum_bit_depth"
    case image
    case mediaCount = "media_count"
    case artist
    case artists
    case label
    case releasedAt = "released_at"
    case title
    case qobuzId = "qobuz_id"
    case version
    case url
    case duration
    case parentalWarning = "parental_warning"
    case tracksCount = "tracks_count"
    case trackCount = "track_count"
    case genre
    case maximumChannelCount = "maximum_channel_count"
    case maximumSamplingRate = "maximum_sampling_rate"
    case id
    case releaseDateOriginal = "release_date_original"
    case releaseDateDownload = "release_date_download"
    case releaseDateStream = "release_date_stream"
    case releaseDatePurchase = "release_date_purchase"
    case dates
    case rights
    case purchasable
    case streamable
    case previewable
    case sampleable
    case downloadable
    case streamableAt = "streamable_at"
    case hires
    case hiresStreamable = "hires_streamable"
    case albumDescription = "description"
    case copyright
    case maximumTechnicalSpecifications = "maximum_technical_specifications"
    case awards
    case audioInfo = "audio_info"
    case trackIds = "track_ids"
    case tracks
    case albumsFromSameArtist = "albums_same_artist"
    case favoritedAt = "favorited_at"
  }
}

extension QBAlbum {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    image = try container.decode(QBImages.self, forKey: .image)
    mediaCount = try container.decodeIfPresent(Int.self, forKey: .mediaCount)
    artist = try container.decodeIfPresent(QBArtist.self, forKey: .artist)
    artists = try container.decodeIfPresent([QBPerformer].self, forKey: .artists)
    label = try container.decode(QBLabel.self, forKey: .label)
    //        releasedAt = try container.decode(Date.self, forKey: .releasedAt)
    title = try container.decode(String.self, forKey: .title).trimmingCharacters(in: .whitespaces)
    qobuzId = try container.decodeIfPresent(Int.self, forKey: .qobuzId)
    version = try container.decodeIfPresent(String.self, forKey: .version)?.trimmingCharacters(in: .whitespaces)
    url = try container.decodeIfPresent(URL.self, forKey: .url)
    duration = try container.decodeIfPresent(Int.self, forKey: .duration)
    parentalWarning = try container.decodeIfPresent(Bool.self, forKey: .parentalWarning)
    if let trackCount = try? container.decodeIfPresent(Int.self, forKey: .tracksCount) {
      tracksCount = trackCount
    } else if let trackCount = try? container.decodeIfPresent(Int.self, forKey: .trackCount) {
      tracksCount = trackCount
    } else {
      tracksCount = nil
    }
    genre = try container.decode(QBGenre.self, forKey: .genre)
    id = try container.decode(String.self, forKey: .id)
    //        releaseDateOriginal = try container.decode(String.self, forKey: .releaseDateOriginal)
    awards = try container.decodeIfPresent([QBAward].self, forKey: .awards)
    
    if let date = try? container.decode(QBDates.self, forKey: .dates) {
      dates = date
    } else {
       var download: Date? = nil
       var original: Date? = nil
       var stream: Date? = nil
       var purchase: Date? = nil
      
       let dateStringFormatter = DateFormatter()
      dateStringFormatter.dateFormat = "yyyy-MM-dd"
      
      if let dateString = try! container.decodeIfPresent(String.self, forKey: .releaseDateDownload) {
        download = try dateStringFormatter.date(from: dateString) ?? nil
      }
      if let dateString = try! container.decodeIfPresent(String.self, forKey: .releaseDateOriginal) {
        original = try dateStringFormatter.date(from: dateString) ?? nil
      }
      if let dateString = try! container.decodeIfPresent(String.self, forKey: .releaseDatePurchase) {
        purchase = try dateStringFormatter.date(from: dateString) ?? nil
      }
      if let dateString = try! container.decodeIfPresent(String.self, forKey: .releaseDateStream) {
        stream = try dateStringFormatter.date(from: dateString) ?? nil
      }
      //            original = try dateStringFormatter.date(from: container.decode(String.self, forKey: .releaseDateOriginal)) ?? nil
      //            purchase = try dateStringFormatter.date(from: container.decode(String.self, forKey: .releaseDatePurchase)) ?? nil
      //            stream = try dateStringFormatter.date(from: container.decode(String.self, forKey: .releaseDateStream)) ?? nil
      
       let dates = QBDates(download: download, original: original ?? Date.now, purchase: purchase, stream: stream)
      self.dates = dates
    }
    
    if let TempRights = try? container.decode(QBRights.self, forKey: .rights) {
      rights = TempRights
    } else {
       var purchasable: Bool? = false
       var streamable: Bool? = false
       var previewable: Bool? = false
       var sampleable: Bool? = false
       var downloadable: Bool? = false
       var streamableAt: Int? = nil
       var hires: Bool? = false
       var hiresStreamable: Bool? = false
      
      
      purchasable = try container.decode(Bool.self, forKey: .purchasable)
      streamable = try container.decode(Bool.self, forKey: .streamable)
      previewable = try container.decode(Bool.self, forKey: .previewable)
      sampleable = try container.decode(Bool.self, forKey: .sampleable)
      downloadable = try container.decode(Bool.self, forKey: .downloadable)
      streamableAt = try container.decodeIfPresent(Int.self, forKey: .streamableAt)
      hires = try container.decode(Bool.self, forKey: .hires)
      hiresStreamable = try container.decode(Bool.self, forKey: .hiresStreamable)
      
       let TempRights = QBRights(purchasable: purchasable ?? false, streamable: streamable ?? false, downloadable: downloadable ?? false, hiresStreamable: hiresStreamable ?? false, hiresPurchasable: nil, hires: hires, sampleable: sampleable, previewable: previewable, streamableAt: streamableAt)
      self.rights = TempRights
    }
    
    if let TempAudioInfo = try? container.decode(QBAudioInfo.self, forKey: .audioInfo) {
      audioInfo = TempAudioInfo
    } else {
      
      //            maximumBitDepth = try container.decode(Int.self, forKey: .maximumBitDepth)
      //            maximumChannelCount = try container.decode(Int.self, forKey: .maximumChannelCount)
      //            maximumSamplingRate = try container.decode(Double.self, forKey: .maximumSamplingRate)
       var bitDepth: Int? = nil
       var channelCount: Int? = nil
       var samplingRate: Double? = nil
      
      bitDepth = try container.decode(Int.self, forKey: .maximumBitDepth)
      channelCount = try container.decode(Int.self, forKey: .maximumChannelCount)
      samplingRate = try container.decode(Double.self, forKey: .maximumSamplingRate)
      
       let TempAudioInfo = QBAudioInfo(replaygainTrackPeak: nil, replaygainTrackGain: nil, maximumSamplingRate: samplingRate, maximumBitDepth: bitDepth, maximumChannelCount: channelCount)
      self.audioInfo = TempAudioInfo
    }
    
    if let description = try? container.decodeIfPresent(String.self, forKey: .albumDescription) {
      albumDescription = description
    }
    copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
    maximumTechnicalSpecifications = try container.decodeIfPresent(String.self, forKey: .maximumTechnicalSpecifications)
    trackIds = try container.decodeIfPresent([Int].self, forKey: .trackIds)
    tracks = try container.decodeIfPresent(QBItems<QBTrack>.self, forKey: .tracks)
    albumsFromSameArtist = try container.decodeIfPresent(QBItems<QBAlbum>.self, forKey: .albumsFromSameArtist)
    if let timestamp = try?  container.decodeIfPresent(Int.self, forKey: .favoritedAt) {
      favoritedAt = Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
  }
  
  public func encode(to encoder: Encoder) throws {
     var container = encoder.container(keyedBy: CodingKeys.self)
    
    //            try container.encode(maximumBitDepth, forKey: .maximumBitDepth)
    try container.encode(image, forKey: .image)
    try container.encodeIfPresent(mediaCount, forKey: .mediaCount)
    try container.encodeIfPresent(artist, forKey: .artist)
    try container.encodeIfPresent(artists, forKey: .artists)
    try container.encode(label, forKey: .label)
    //            try container.encode(releasedAt, forKey: .releasedAt)
    try container.encode(title, forKey: .title)
    try container.encode(qobuzId, forKey: .qobuzId)
    try container.encodeIfPresent(version, forKey: .version)
    try container.encodeIfPresent(url, forKey: .url)
    try container.encodeIfPresent(duration, forKey: .duration)
    try container.encodeIfPresent(parentalWarning, forKey: .parentalWarning)
    try container.encodeIfPresent(tracksCount, forKey: .tracksCount)
    try container.encode(genre, forKey: .genre)
    //            try container.encode(maximumChannelCount, forKey: .maximumChannelCount)
    //            try container.encode(maximumSamplingRate, forKey: .maximumSamplingRate)
    try container.encode(id, forKey: .id)
    try container.encode(rights, forKey: .rights)
    try container.encode(awards, forKey: .awards)
    //            try container.encodeIfPresent(purchasable, forKey: .purchasable)
    //            try container.encode(streamable, forKey: .streamable)
    //            try container.encode(previewable, forKey: .previewable)
    //            try container.encode(sampleable, forKey: .sampleable)
    //            try container.encode(downloadable, forKey: .downloadable)
    //            try container.encodeIfPresent(streamableAt, forKey: .streamableAt)
    //            try container.encode(hires, forKey: .hires)
    //            try container.encode(hiresStreamable, forKey: .hiresStreamable)
    try container.encodeIfPresent(dates, forKey: .dates)
    try container.encode(audioInfo, forKey: .audioInfo)
    try container.encodeIfPresent(copyright, forKey: .copyright)
    try container.encodeIfPresent(maximumTechnicalSpecifications, forKey: .maximumTechnicalSpecifications)
    try container.encodeIfPresent(trackIds, forKey: .trackIds)
    try container.encodeIfPresent(tracks, forKey: .tracks)
    try container.encodeIfPresent(albumsFromSameArtist, forKey: .albumsFromSameArtist)
    try container.encodeIfPresent(favoritedAt, forKey: .favoritedAt)
  }
  
  private func parseDateString(_ dateString: String) -> Date? {
     let dateStringFormatter = DateFormatter()
    dateStringFormatter.dateFormat = "yyyy-MM-dd"
    return dateStringFormatter.date(from: dateString)
  }
}
