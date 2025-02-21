//
//  QBArtistBiography.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBArtistBiography: Codable {
    public let summary: String
    public let content: String
    public let source: String
    public let language: String
    
    enum CodingKeys: String, CodingKey {
        case summary
        case content
        case source
        case language
    }
}
