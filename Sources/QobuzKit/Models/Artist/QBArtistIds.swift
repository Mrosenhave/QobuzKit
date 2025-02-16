//
//  QBArtistIds.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 12/10/2024.
//

import Foundation

struct QBArtistIds: Encodable {
  let artistIds: [String]
  
  enum CodingKeys: String, CodingKey {
    case artistIds = "artist_ids"
  }
}
