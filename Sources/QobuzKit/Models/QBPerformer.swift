//
//  QBPerformer.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBPerformer: Codable, Hashable {
  let id: Int
  let name: String
  let images: QBArtistImage?
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case images
  }
}

extension QBPerformer {
  static func == (lhs: QBPerformer, rhs: QBPerformer) -> Bool {
    return lhs.id == rhs.id && rhs.name == lhs.name && rhs.images == lhs.images
}

func hash(into hasher: inout Hasher) {
  hasher.combine(id)
}
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(Int.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    
    let imagesPortrait = try container.decodeIfPresent(QBArtistPageImages.self, forKey: .images)?.portrait
    if let hash = imagesPortrait?.hash, let format = imagesPortrait?.format {
      self.images = hashStringToImageModel(hash: hash, format: format)
    } else {
      self.images = nil // Provide a default value if necessary
    }
  }
}
