//
//  QBRadioAlbum.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - Album
struct QBRadioAlbum: Codable {
    let id, title: String
    let version: String?
    let image: QBImages
    let label: QBLabel
    let genre: QBGenre
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case version
        case image
        case label
        case genre
    }
}
