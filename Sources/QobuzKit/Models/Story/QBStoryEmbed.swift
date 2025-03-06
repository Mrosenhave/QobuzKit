//
//  QBStoryEmbed.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 28/02/2025.
//


public struct QBStoryEmbed<T: Decodable>: Decodable, Hashable {
  
  public let config: QBStoryEmbedConfig<T>
    public let id: String
    public let url: String

    public enum CodingKeys: String, CodingKey {
        case config = "config"
        case id = "id"
        case url = "url"
    }

    public init(config: QBStoryEmbedConfig<T>, id: String, url: String) {
        self.config = config
        self.id = id
        self.url = url
    }
}
