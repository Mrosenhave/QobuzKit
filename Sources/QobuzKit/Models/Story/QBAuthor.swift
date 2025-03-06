//
//  QBAuthor.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 27/02/2025.
//


public struct QBAuthor: Codable, Hashable {
    public let id: String
    public let name: String
    public let slug: String

    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
    }

    public init(id: String, name: String, slug: String) {
        self.id = id
        self.name = name
        self.slug = slug
    }
}

public extension QBAuthor {
  static func == (lhs: QBAuthor, rhs: QBAuthor) -> Bool {
    return lhs.name == rhs.name && lhs.id == rhs.id
  }
}
