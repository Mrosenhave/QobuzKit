//
//  QBTrackSuggest.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 16/10/2024.
//

import Foundation

public struct QBTrackSuggest: Codable {
  public init(algorithm: QBAlgorithmType, tracks: QBItems<QBTrack>) {
    self.algorithm = algorithm
    self.tracks = tracks
  }
  
  public let algorithm: QBAlgorithmType
  public let tracks: QBItems<QBTrack>
  
  enum CodingKeys: String, CodingKey {
    case algorithm
    case tracks
  }
}

public struct QBTrackSuggestRequest: Codable {
  public init(limit: Int, listenedTracksIds: [Int], trackToAnalyse: [QBTrackToAnalyse]) {
    self.limit = limit
    self.listenedTracksIds = listenedTracksIds
    self.trackToAnalyse = trackToAnalyse
  }
  
  public let limit: Int
  public let listenedTracksIds: [Int]
  public let trackToAnalyse: [QBTrackToAnalyse]
  enum CodingKeys: String, CodingKey {
    case limit
    case listenedTracksIds = "listened_tracks_ids"
    case trackToAnalyse = "track_to_analyse"
  }
}

public struct QBTrackToAnalyse: Codable {
  public init(trackId: Int) {
    self.trackId = trackId
  }
  
//  public let artistId: Int
//  public let genreId: Int
//  public let labelId: Int
  public let trackId: Int
  enum CodingKeys: String, CodingKey {
    case trackId  = "track_id"
  }
}

