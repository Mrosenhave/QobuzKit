//
//  QBStory.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 27/02/2025.
//

public struct QBStory: Codable, Hashable {
  
    public let authors: [QBAuthor]
    public let descriptionShort: String
    public let displayDate: Int
    public let id: String
    public let image: String
    public let images: [QBStoryImage]
    public let sectionSlugs: [String]
    public let title: String

    public enum CodingKeys: String, CodingKey {
        case authors = "authors"
        case descriptionShort = "description_short"
        case displayDate = "display_date"
        case id = "id"
        case image = "image"
        case images = "images"
        case sectionSlugs = "section_slugs"
        case title = "title"
    }

    public init(authors: [QBAuthor], descriptionShort: String, displayDate: Int, id: String, image: String, images: [QBStoryImage], sectionSlugs: [String], title: String) {
        self.authors = authors
        self.descriptionShort = descriptionShort
        self.displayDate = displayDate
        self.id = id
        self.image = image
        self.images = images
        self.sectionSlugs = sectionSlugs
        self.title = title
    }
}

public extension QBStory {
  static func == (lhs: QBStory, rhs: QBStory) -> Bool {
    return lhs.title == rhs.title && lhs.id == rhs.id
  }
}
