//
//  QBGenre.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBGenre: Codable, Hashable {
    let path: [Int]
    let name: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case path
        case name
        case id
    }
}

struct QBGenreList: Codable {
    let genres: QBItems<QBGenre>
}
