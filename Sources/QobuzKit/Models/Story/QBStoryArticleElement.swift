//
//  QBStoryArticleElement.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 27/02/2025.
//

import Foundation

public struct QBStoryArticleElement: Decodable, Hashable {
    public let content: String?
    public let type: QBStoryContentType
    public let id: String?
//    public let additionalProperties: ContentElementAdditionalProperties?
//    public let auth: Auth?
//    public let createdDate: Date?
    public let height: Int?
//    public let lastUpdatedDate: Date?
    public let licensable: Bool?
//    public let owner: ContentElementOwner?
//    public let source: SourceClass?
    public let url: String?
//    public let version: ContentElementVersion?
    public let width: Int?
  public let embed: QBStoryEmbedType?
    public let subtype: QBStorySubtype?
//    public let rawOembed: RawOembed?
//    public let referent: Referent?

    public enum CodingKeys: String, CodingKey {
        case content = "content"
        case type = "type"
        case id = "_id"
//        case additionalProperties = "additional_properties"
//        case auth = "auth"
//        case createdDate = "created_date"
        case height = "height"
//        case lastUpdatedDate = "last_updated_date"
        case licensable = "licensable"
//        case owner = "owner"
//        case source = "source"
        case url = "url"
//        case version = "version"
        case width = "width"
        case embed = "embed"
        case subtype = "subtype"
//        case rawOembed = "raw_oembed"
//        case referent = "referent"
    }

  public init(content: String?, type: QBStoryContentType, id: String?, /*additionalProperties: ContentElementAdditionalProperties?, auth: Auth?, createdDate: Date?,*/ height: Int?, /*lastUpdatedDate: Date?,*/ licensable: Bool?, /*owner: ContentElementOwner?, source: SourceClass?,*/ url: String?, /*version: ContentElementVersion?,*/ width: Int?, embed: QBStoryEmbedType?, subtype: QBStorySubtype?/*, rawOembed: RawOembed?, referent: Referent?*/) {
        self.content = content
        self.type = type
        self.id = id
//        self.additionalProperties = additionalProperties
//        self.auth = auth
//        self.createdDate = createdDate
        self.height = height
//        self.lastUpdatedDate = lastUpdatedDate
        self.licensable = licensable
//        self.owner = owner
//        self.source = source
        self.url = url
//        self.version = version
        self.width = width
        self.embed = embed
        self.subtype = subtype
//        self.rawOembed = rawOembed
//        self.referent = referent
    }
}

public enum QBStoryEmbedType: Decodable, Hashable {
  case albums(QBStoryEmbed<QBArtistRelease>)
  case playlists(QBStoryEmbed<QBPlaylist>)
  public init(from decoder: Decoder) throws {
          let container = try decoder.singleValueContainer()
          
    if let releaseEmbed = try? container.decode(QBStoryEmbed<QBArtistRelease>.self) {
              self = .albums(releaseEmbed)
              return
          }
          
    if let playlistEmbed = try? container.decode(QBStoryEmbed<QBPlaylist>.self) {
              self = .playlists(playlistEmbed)
              return
          }
          
          throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown embed type")
      }
}

public enum QBStoryContentType: String, Codable {
    case customEmbed = "custom_embed"
    case image
    case oembedResponse = "oembed_response"
    case text
  case reference
  case gallery
}

public enum QBStorySubtype: String, Codable {
    case qobuzAlbums = "qobuz-albums"
    case qobuzPlaylists = "qobuz-playlists"
    case youtube
}
