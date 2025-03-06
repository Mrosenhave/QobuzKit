//
//  QBStoryEmbedConfig.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 28/02/2025.
//


// MARK: - Config
public struct QBStoryEmbedConfig<T: Decodable>: Decodable, Hashable {
  public let objects: [T]
    public let subtitle: String
    public let title: String

    public enum CodingKeys: String, CodingKey {
        case objects = "objects"
        case subtitle = "subtitle"
        case title = "title"
    }

    public init(objects: [T], subtitle: String, title: String) {
        self.objects = objects
        self.subtitle = subtitle
        self.title = title
    }
}

public extension QBStoryEmbedConfig {
  static func == (lhs: QBStoryEmbedConfig<T>, rhs: QBStoryEmbedConfig<T>) -> Bool {
    return lhs.subtitle == rhs.subtitle && lhs.title == rhs.title
  }
  func hash(into hasher: inout Hasher) {
    hasher.combine(subtitle)
    hasher.combine(title)
  }
}
