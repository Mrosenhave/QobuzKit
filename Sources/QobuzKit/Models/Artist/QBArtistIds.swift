//
//  QBArtistIds.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 12/10/2024.
//

import Foundation

public struct QBArtistIds: Encodable {
  public init(artistIds: [Int]) {
    self.artistIds = artistIds
  }
  
  public let artistIds: [Int]
  
  enum CodingKeys: String, CodingKey {
    case artistIds = "artist_ids"
  }
}
