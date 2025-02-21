//
//  QBTag.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBTag: Codable {
  public let featuredTagID, nameJSON, slug, color: String?
  public let genreTag: QBGenreTag?
  public let name: QBTagName?
  public let isDiscover: Bool
  
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
public struct QBTagName: Codable {
  public let fr: String
  public let en: String
  public let de: String
  public let it: String
  public let nl: String
  public let es: String
  public let pt: String
  public let ja: String
}
