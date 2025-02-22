//
//  QBTypes.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//


import Foundation

public struct QBTypes: Codable {
  public init(types: QBType) {
    self.types = types
  }
  
  public let types: QBType
}
