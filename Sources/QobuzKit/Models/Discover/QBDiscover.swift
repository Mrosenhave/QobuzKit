//
//  QBDiscover.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

struct QBDiscover: Codable {
    let containers: QBContainers
    
    enum CodingKeys: String, CodingKey {
        case containers
    }
}
