//
//  QBGenreTag.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBGenreTag: Codable {
    public let genreID, name: String
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genre_id"
        case name
    }
}
