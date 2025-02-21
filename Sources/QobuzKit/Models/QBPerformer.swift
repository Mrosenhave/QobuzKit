//
//  QBPerformer.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBPerformer: Codable, Hashable {
  public init(id: Int, name: String, images: QBArtistImage? = nil) {
    self.id = id
    self.name = name
    self.images = images
  }
  
  public static func == (lhs: QBPerformer, rhs: QBPerformer) -> Bool {
    return lhs.id == rhs.id && rhs.name == lhs.name && rhs.images == lhs.images
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  public let id: Int
  public let name: String
  public let images: QBArtistImage?

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case images
  }
}

extension QBPerformer {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = try container.decode(Int.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)

    let imagesPortrait = try container.decodeIfPresent(
      QBArtistPageImages.self, forKey: .images)?.portrait
    if let hash = imagesPortrait?.hash, let format = imagesPortrait?.format {
      self.images = hashStringToImageModel(hash: hash, format: format)
    } else {
      self.images = nil  // Provide a default value if necessary
    }
  }
}
