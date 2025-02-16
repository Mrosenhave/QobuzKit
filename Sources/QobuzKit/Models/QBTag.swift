//
//  QBTag.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBTag: Codable {
  let featuredTagID, nameJSON, slug, color: String?
  let genreTag: QBGenreTag?
  let name: QBTagName?
  let isDiscover: Bool
  
  enum CodingKeys: String, CodingKey {
    case featuredTagID = "featured_tag_id"
    case nameJSON = "name_json"
    case slug
    case color
    case genreTag = "genre_tag"
    case name
    case isDiscover = "is_discover"
  }
}
struct QBTagName: Codable {
  let fr: String
  let en: String
  let de: String
  let it: String
  let nl: String
  let es: String
  let pt: String
  let ja: String
}
