//
//  QBHasMoreItems.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public struct QBHasMoreItems<T: Codable>: Codable {
    public let type: QBReleaseType?
    public let hasMore: Bool
    public let items: [T]
    
    enum CodingKeys: String, CodingKey {
        case type
        case hasMore = "has_more"
        case items
    }
}
