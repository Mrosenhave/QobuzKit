//
//  QBStoryImage.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 27/02/2025.
//

public struct QBStoryImage: Codable, Hashable {
    public let format: String
    public let url: String

    public enum CodingKeys: String, CodingKey {
        case format = "format"
        case url = "url"
    }

    public init(format: String, url: String) {
        self.format = format
        self.url = url
    }
}

public extension QBStoryImage {
  static func == (lhs: QBStoryImage, rhs: QBStoryImage) -> Bool {
    return lhs.format == rhs.format && lhs.url == rhs.url
  }
}
