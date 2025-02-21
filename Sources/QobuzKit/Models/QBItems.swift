//
//  QBItems.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBItems<T: Codable>: Codable {
  public init(items: [T]) {
    self.items = items
  }
  
    public let limit: Int? = nil
    public let offset: Int? = nil
    public let total: Int? = nil
    public let items: [T]
    
    enum CodingKeys: String, CodingKey {
        case limit
        case offset
        case total
        case items
    }
}
