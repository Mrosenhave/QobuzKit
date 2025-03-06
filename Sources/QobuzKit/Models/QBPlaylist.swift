//
//  QBPlaylist.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBPlaylist: Codable, Hashable, QBContent, Identifiable {
  public init(imageRectangleMini: [String]? = nil, isPublished: Bool? = nil, featuredArtists: [QBArtist]? = nil, playlistDescription: String? = nil, createdAt: Date? = nil, timestampPosition: Int? = nil, images300: [String]? = nil, images600: [String]? = nil, imagesOrg: [String]? = nil, duration: Int, updatedAt: Date? = nil, publishedTo: Int? = nil, genres: [QBGenre]? = nil, tags: [QBTagElement]? = nil, imageRectangle: String? = nil, id: Int, slug: String? = nil, owner: QBArtist, usersCount: Int? = nil, images150: [String]? = nil, images: [String]? = nil, isCollaborative: Bool? = nil, tracksCount: Int, publicAt: Int? = nil, name: String, isPublic: Bool? = nil, publishedFrom: Int? = nil, isFeatured: Bool? = nil, tracks: QBItems<QBTrack>? = nil, trackIds: [Int]? = nil, subscribedAt: Date? = nil) {
    self.imageRectangleMini = imageRectangleMini
    self.isPublished = isPublished
    self.featuredArtists = featuredArtists
    self.playlistDescription = playlistDescription
    self.createdAt = createdAt
    self.timestampPosition = timestampPosition
    self.images300 = images300
    self.images600 = images600
    self.imagesOrg = imagesOrg
    self.duration = duration
    self.updatedAt = updatedAt
    self.publishedTo = publishedTo
    self.genres = genres
    self.tags = tags
    self.imageRectangle = imageRectangle
    self.id = id
    self.slug = slug
    self.owner = owner
    self.usersCount = usersCount
    self.images150 = images150
    self.images = images
    self.isCollaborative = isCollaborative
    self.tracksCount = tracksCount
    self.publicAt = publicAt
    self.name = name
    self.isPublic = isPublic
    self.publishedFrom = publishedFrom
    self.isFeatured = isFeatured
    self.tracks = tracks
    self.trackIds = trackIds
    self.subscribedAt = subscribedAt
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  public static func == (lhs: QBPlaylist, rhs: QBPlaylist) -> Bool {
    return lhs.id == rhs.id && lhs.trackIds == rhs.trackIds && lhs.updatedAt == rhs.updatedAt && lhs.name == rhs.name && lhs.playlistDescription == rhs.playlistDescription
  }
  
  public var imageRectangleMini: [String]?
  public var isPublished: Bool?
  public var featuredArtists: [QBArtist]?
  public var playlistDescription: String?
  public var createdAt: Date?
  public var timestampPosition: Int?
  public var images300: [String]?
  public var images600: [String]?
  public var imagesOrg: [String]?
  public var duration: Int?
  public var updatedAt: Date?
  public var publishedTo: Int?
  public var genres: [QBGenre]?
  public var tags: [QBTagElement]? //Can be either QBTag or QBTagElement :(
  public var imageRectangle: String?
  public var id: Int
  public var slug: String?
  public var owner: QBArtist?
  public var usersCount: Int?
  public var images150: [String]?
  public var images: [String]?
  public var isCollaborative: Bool?
  public var tracksCount: Int?
  public var publicAt: Int?
  public var name: String
  public var isPublic: Bool?
  public var publishedFrom: Int?
  public var isFeatured: Bool?
  public var tracks: QBItems<QBTrack>?
  public var trackIds: [Int]?
  public var subscribedAt: Date?
  
  enum CodingKeys: String, CodingKey {
    case imageRectangleMini = "image_rectangle_mini"
    case isPublished = "is_published"
    case featuredArtists = "featured_artists"
    case playlistDescription = "description"
    case createdAt = "created_at"
    case timestampPosition = "timestamp_position"
    case images300
    case duration
    case updatedAt = "updated_at"
    case publishedTo = "published_to"
    case genres
    case tags
    case imageRectangle = "image_rectangle"
    case image
    case id
    case slug
    case owner
    case usersCount = "users_count"
    case images150
    case images
    case isCollaborative = "is_collaborative"
    case tracksCount = "tracks_count"
    case publicAt = "public_at"
    case name
    case title
    case isPublic = "is_public"
    case publishedFrom = "published_from"
    case isFeatured = "is_featured"
    case tracks
    case trackIds = "track_ids"
    case subscribedAt = "subscribed_at"
  }
  
}

extension QBPlaylist {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    imageRectangleMini = try container.decodeIfPresent([String].self, forKey: .imageRectangleMini)
    isPublished = try container.decodeIfPresent(Bool.self, forKey: .isPublished)
    featuredArtists = try container.decodeIfPresent([QBArtist].self, forKey: .featuredArtists)
    playlistDescription = try container.decodeIfPresent(String.self, forKey: .playlistDescription)
    if let timestamp = try?  container.decodeIfPresent(Int.self, forKey: .createdAt) {
      createdAt = Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
    timestampPosition = try container.decodeIfPresent(Int.self, forKey: .timestampPosition)
    images300 = try container.decodeIfPresent([String].self, forKey: .images300)
    images600 = try container.decodeIfPresent([String].self, forKey: .images300)?.map( { $0.replacingOccurrences(of: "_300", with: "_600") } )
    imagesOrg = try container.decodeIfPresent([String].self, forKey: .images300)?.map( { $0.replacingOccurrences(of: "_300", with: "_org") } )
    duration = try container.decodeIfPresent(Int.self, forKey: .duration)
    if let timestamp = try?  container.decodeIfPresent(Int.self, forKey: .updatedAt) {
      updatedAt = Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
    publishedTo = try container.decodeIfPresent(Int.self, forKey: .publishedTo)
    genres = try container.decodeIfPresent([QBGenre].self, forKey: .genres)
    if let tempTags = try? container.decodeIfPresent([QBTagElement].self, forKey: .tags) {
      tags = tempTags
    } else if let tempTags = try? container.decodeIfPresent([QBTag].self, forKey: .tags) {
      var tagsArray = [QBTagElement]()
      for tag in tempTags {
        let tagElement = QBTagElement(id: 0, slug: tag.slug ?? "", name: tag.name?.en ?? "")
        tagsArray.append(tagElement)
      }
    } else {
      tags = nil
    }
    if let image = try? container.decodeIfPresent([String].self, forKey: .imageRectangle)?.first {
      imageRectangle = image
    } else if let image = try? container.decodeIfPresent(QBRectangleImage.self, forKey: .image)?.rectangle {
      imageRectangle = image
    } else if let imageArray = try? container.decodeIfPresent([String: [String]].self, forKey: .images)?.values.first {
      imageRectangle = imageArray.first
    } else {
      imageRectangle = nil
    }
    id = try container.decode(Int.self, forKey: .id)
    slug = try container.decodeIfPresent(String.self, forKey: .slug)
    owner = try container.decodeIfPresent(QBArtist.self, forKey: .owner)
    usersCount = try container.decodeIfPresent(Int.self, forKey: .usersCount)
    images150 = try container.decodeIfPresent([String].self, forKey: .images150)
    if let imageArray = try? container.decodeIfPresent([String].self, forKey: .images) {
      images = imageArray
    } else if let imageArray = try? container.decodeIfPresent([String: [String]].self, forKey: .images)?.values.first {
      images = imageArray
    }
    isCollaborative = try container.decodeIfPresent(Bool.self, forKey: .isCollaborative)
    //           tags = try container.decodeIfPresent([QBTag].self, forKey: .tags)
    tracksCount = try container.decodeIfPresent(Int.self, forKey: .tracksCount)
    publicAt = try? container.decodeIfPresent(Int.self, forKey: .publicAt)
    if let tempName = try? container.decodeIfPresent(String.self, forKey: .name) {
      name = tempName
    } else if let tempName = try? container.decodeIfPresent(String.self, forKey: .title) {
      name = tempName
    } else {
      name = ""
    }
    isPublic = try container.decodeIfPresent(Bool.self, forKey: .isPublic)
    publishedFrom = try container.decodeIfPresent(Int.self, forKey: .publishedFrom)
    isFeatured = try container.decodeIfPresent(Bool.self, forKey: .isFeatured)
    tracks = try container.decodeIfPresent(QBItems<QBTrack>.self, forKey: .tracks)
    trackIds = try container.decodeIfPresent([Int].self, forKey: .trackIds)
    if let timestamp = try?  container.decodeIfPresent(Int.self, forKey: .subscribedAt) {
      subscribedAt = Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
  }
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    try container.encodeIfPresent(imageRectangleMini, forKey: .imageRectangleMini)
    try container.encodeIfPresent(isPublished, forKey: .isPublished)
    try container.encodeIfPresent(featuredArtists, forKey: .featuredArtists)
    try container.encodeIfPresent(playlistDescription, forKey: .playlistDescription)
    try container.encodeIfPresent(createdAt, forKey: .createdAt)
    try container.encodeIfPresent(timestampPosition, forKey: .timestampPosition)
    try container.encodeIfPresent(images300, forKey: .images300)
    try container.encodeIfPresent(duration, forKey: .duration)
    try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
    try container.encodeIfPresent(publishedTo, forKey: .publishedTo)
    try container.encodeIfPresent(genres, forKey: .genres)
    try container.encodeIfPresent(tags, forKey: .tags)
    try container.encodeIfPresent(imageRectangle, forKey: .imageRectangle)
    try container.encode(id, forKey: .id)
    try container.encodeIfPresent(slug, forKey: .slug)
    try container.encodeIfPresent(owner, forKey: .owner)
    try container.encodeIfPresent(usersCount, forKey: .usersCount)
    try container.encodeIfPresent(images150, forKey: .images150)
    try container.encodeIfPresent(images, forKey: .images)
    try container.encodeIfPresent(isCollaborative, forKey: .isCollaborative)
    //           try container.encodeIfPresent(tags, forKey: .tags)
    try container.encodeIfPresent(tracksCount, forKey: .tracksCount)
    try container.encodeIfPresent(publicAt, forKey: .publicAt)
    try container.encode(name, forKey: .name)
    try container.encodeIfPresent(isPublic, forKey: .isPublic)
    try container.encodeIfPresent(publishedFrom, forKey: .publishedFrom)
    try container.encodeIfPresent(isFeatured, forKey: .isFeatured)
    try container.encodeIfPresent(tracks, forKey: .tracks)
    try container.encodeIfPresent(trackIds, forKey: .trackIds)
    try container.encodeIfPresent(subscribedAt, forKey: .subscribedAt)
  }
}
