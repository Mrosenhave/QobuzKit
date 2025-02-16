//
//  QBItems.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBItems<T: Codable>: Codable {
    let limit: Int? = nil
    let offset: Int? = nil
    let total: Int? = nil
    let items: [T]
    
    enum CodingKeys: String, CodingKey {
        case limit
        case offset
        case total
        case items
    }
}
