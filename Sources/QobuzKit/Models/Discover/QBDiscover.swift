//
//  QBDiscover.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public struct QBDiscover: Codable {
    public let containers: QBContainers
    
    enum CodingKeys: String, CodingKey {
        case containers
    }
}
