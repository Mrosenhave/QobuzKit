//
//  QBRadioAlbum.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - Album
public struct QBRadioAlbum: Codable {
    public let id, title: String
    public let version: String?
    public let image: QBImages
    public let label: QBLabel
    public let genre: QBGenre
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case version
        case image
        case label
        case genre
    }
}
