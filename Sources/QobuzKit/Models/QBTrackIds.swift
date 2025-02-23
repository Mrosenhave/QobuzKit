//
//  QBTrackIds.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation

public struct QBTrackIds: Codable {
  public let trackIds: [Int]
  enum CodingKeys: String, CodingKey {
    case trackIds = "tracks_id"
  }
}
