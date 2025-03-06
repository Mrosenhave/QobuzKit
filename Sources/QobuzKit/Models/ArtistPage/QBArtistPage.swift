//
//  QBArtistPage.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public struct QBArtistPage: Codable {
  public let id: Int
  public let name: String
  public let biography: QBArtistPageBiography?
  public let images: QBArtistImage?
  public let similarArtists: QBHasMoreItems<QBArtistPageArtist>
  public let topTracks: [QBArtistTopTrack]
  public let lastRelease: QBArtistRelease?
  public let releases: [QBHasMoreItems<QBArtistRelease>]
  public let playlists: QBHasMoreItems<QBPlaylist>
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case biography
    case images
    case similarArtists = "similar_artists"
    case topTracks = "top_tracks"
    case lastRelease = "last_release"
    case releases
    case playlists
  }
}

extension QBArtistPage {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(Int.self, forKey: .id)
    if let nameString = try? container.decode(String.self, forKey: .name) {
      // Try decoding `name` as a simple string first
      self.name = nameString
    } else if let nameDict = try? container.decode([String: String].self, forKey: .name),
              let displayName = nameDict["display"] {
      // Try decoding `name` as a nested dictionary
      self.name = displayName
    } else {
      self.name = ""
    }
    biography = try container.decodeIfPresent(QBArtistPageBiography.self, forKey: .biography)
    
    let imagesPortrait = try container.decodeIfPresent(QBArtistPageImages.self, forKey: .images)?.portrait
    if let hash = imagesPortrait?.hash, let format = imagesPortrait?.format {
      self.images = hashStringToImageModel(hash: hash, format: format)
    } else {
      self.images = nil // Provide a default value if necessary
    }
    
    similarArtists = try container.decode(QBHasMoreItems<QBArtistPageArtist>.self, forKey: .similarArtists)
    topTracks = try container.decode([QBArtistTopTrack].self, forKey: .topTracks)
    lastRelease = try container.decodeIfPresent(QBArtistRelease.self, forKey: .lastRelease)
    releases = try container.decode([QBHasMoreItems<QBArtistRelease>].self, forKey: .releases)
    playlists = try container.decode(QBHasMoreItems<QBPlaylist>.self, forKey: .playlists)
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    try container.encode(id, forKey: .id)
    try container.encode(name, forKey: .name)
    try container.encode(biography, forKey: .biography)
    
    //            if let images = images {
    //                // Convert QBArtistImage to QBArtistPageImagesPortrait for encoding
    //                public let imagesPortrait = QBArtistPageImagesPortrait(hash: images.large, format: "jpg")
    //                try container.encode(imagesPortrait, forKey: .images)
    //            } else {
    //                try container.encodeNil(forKey: .images)
    //            }
    
    try container.encodeNil(forKey: .images)
    try container.encode(similarArtists, forKey: .similarArtists)
    try container.encode(topTracks, forKey: .topTracks)
    try container.encode(lastRelease, forKey: .lastRelease)
    try container.encode(releases, forKey: .releases)
    try container.encode(playlists, forKey: .playlists)
  }
}


// MARK: - ArtistPageBiography
public struct QBArtistPageBiography: Codable {
  public let content: String
}
// MARK: - ArtistPageImages
public struct QBArtistPageImages: Codable {
  public let portrait: QBArtistImageHashFormat?
  
}
// MARK: - ArtistPageImagesPortrait
public struct QBArtistImageHashFormat: Codable {
  public let id: Int?
  public let hash: String
  public let format: String
}

// MARK: - Item
public struct QBArtistPageArtist: Codable, Hashable {
  public let id: Int
  public let name: String
  public let images: QBArtistImage?
}
extension QBArtistPageArtist {
  public static func == (lhs: QBArtistPageArtist, rhs: QBArtistPageArtist) -> Bool {
    return lhs.id == rhs.id
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(Int.self, forKey: .id)
//    name = try container.decode(QBArtistPageName.self, forKey: .name)
    if let nameString = try? container.decode(String.self, forKey: .name) {
      // Try decoding `name` as a simple string first
        self.name = nameString
    } else if let nameDict = try? container.decode([String: String].self, forKey: .name),
       let displayName = nameDict["display"] {
      // Try decoding `name` as a nested dictionary
        self.name = displayName
    } else {
      self.name = ""
    }
    
    let imagesPortrait = try container.decodeIfPresent(QBArtistPageImages.self, forKey: .images)?.portrait
    if let hash = imagesPortrait?.hash, let format = imagesPortrait?.format {
      self.images = hashStringToImageModel(hash: hash, format: format)
    } else {
      self.images = nil // Provide a default value if necessary
    }
  }
}

