//
//  QBGenre.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBGenre: Codable, Hashable {
    public let path: [Int]
    public let name: String
    public let id: Int
    
    enum CodingKeys: String, CodingKey {
        case path
        case name
        case id
    }
}

public struct QBGenreList: Codable {
    public let genres: QBItems<QBGenre>
}
