//
//  QBHasMoreItems.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

struct QBHasMoreItems<T: Codable>: Codable {
    let type: QBReleaseType?
    let hasMore: Bool
    let items: [T]
    
    enum CodingKeys: String, CodingKey {
        case type
        case hasMore = "has_more"
        case items
    }
}
