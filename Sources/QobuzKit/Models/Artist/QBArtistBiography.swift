//
//  QBArtistBiography.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBArtistBiography: Codable {
    let summary: String
    let content: String
    let source: String
    let language: String
    
    enum CodingKeys: String, CodingKey {
        case summary
        case content
        case source
        case language
    }
}
