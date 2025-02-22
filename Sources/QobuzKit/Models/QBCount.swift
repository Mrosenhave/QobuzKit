//
//  QBCount.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

public struct QBCount: Codable {
  public init(total: Int) {
    self.total = total
  }
  
  public let total: Int
}
