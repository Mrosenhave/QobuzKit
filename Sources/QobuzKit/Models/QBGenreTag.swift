//
//  QBGenreTag.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBGenreTag: Codable {
    let genreID, name: String
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genre_id"
        case name
    }
}
