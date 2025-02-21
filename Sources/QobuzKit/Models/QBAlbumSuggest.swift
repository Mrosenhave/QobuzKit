//
//  QBAlbumSuggest.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 01/08/2024.
//

import Foundation

public struct QBAlbumSuggest: Codable {
    public let algorithm: QBAlgorithmType
    public let albums: QBItems<QBAlbum>
    
    enum CodingKeys: String, CodingKey {
        case algorithm
        case albums
    }
}

public enum QBAlgorithmType: String, Codable {
    case suggestAlbum = "suggest-album"
    case artistAlbum = "artist-album"
    case artist
    case auto
}
