//
//  QBArtistPage.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

struct QBArtistPage: Codable {
  let id: Int
  let name: QBArtistPageName
  let biography: QBArtistPageBiography?
  let images: QBArtistImage?
  let similarArtists: QBHasMoreItems<QBArtistPageArtist>
  let topTracks: [QBArtistTopTrack]
  let lastRelease: QBArtistRelease?
  let releases: [QBHasMoreItems<QBArtistRelease>]
  let playlists: QBHasMoreItems<QBPlaylist>
  
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
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(Int.self, forKey: .id)
    name = try container.decode(QBArtistPageName.self, forKey: .name)
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
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    try container.encode(id, forKey: .id)
    try container.encode(name, forKey: .name)
    try container.encode(biography, forKey: .biography)
    
    //            if let images = images {
    //                // Convert QBArtistImage to QBArtistPageImagesPortrait for encoding
    //                let imagesPortrait = QBArtistPageImagesPortrait(hash: images.large, format: "jpg")
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

// MARK: - ArtistPageName
struct QBArtistPageName: Codable {
  let display: String
}
// MARK: - ArtistPageBiography
struct QBArtistPageBiography: Codable {
  let content: String
}
// MARK: - ArtistPageImages
struct QBArtistPageImages: Codable {
  let portrait: QBArtistImageHashFormat?
  
}
// MARK: - ArtistPageImagesPortrait
struct QBArtistImageHashFormat: Codable {
  let id: Int?
  let hash: String
  let format: String
}

// MARK: - Item
struct QBArtistPageArtist: Codable, Hashable {
  let id: Int
  let name: QBArtistPageName
  let images: QBArtistImage?
}
extension QBArtistPageArtist {
  static func == (lhs: QBArtistPageArtist, rhs: QBArtistPageArtist) -> Bool {
    return lhs.id == rhs.id
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(Int.self, forKey: .id)
    name = try container.decode(QBArtistPageName.self, forKey: .name)
    
    let imagesPortrait = try container.decodeIfPresent(QBArtistPageImages.self, forKey: .images)?.portrait
    if let hash = imagesPortrait?.hash, let format = imagesPortrait?.format {
      self.images = hashStringToImageModel(hash: hash, format: format)
    } else {
      self.images = nil // Provide a default value if necessary
    }
  }
}

