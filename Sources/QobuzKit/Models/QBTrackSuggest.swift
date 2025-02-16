//
//  QBTrackSuggest.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 16/10/2024.
//

import Foundation

struct QBTrackSuggest: Codable {
  let algorithm: QBAlgorithmType
  let tracks: QBItems<QBTrack>
  
  enum CodingKeys: String, CodingKey {
    case algorithm
    case tracks
  }
}

struct QBTrackSuggestRequest: Codable {
  let limit: Int
  let listenedTracksIds: [Int]
  let trackToAnalyse: [QBTrackToAnalyse]
  enum CodingKeys: String, CodingKey {
    case limit
    case listenedTracksIds = "listened_tracks_ids"
    case trackToAnalyse = "track_to_analyse"
  }
}

struct QBTrackToAnalyse: Codable {
//  let artistId: Int
//  let genreId: Int
//  let labelId: Int
  let trackId: Int
  enum CodingKeys: String, CodingKey {
    case trackId  = "track_id"
  }
}

