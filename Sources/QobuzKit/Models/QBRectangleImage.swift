//
//  QBRectangleImage.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public struct QBRectangleImage: Codable {
    public let rectangle: String
    
    enum CodingKeys: String, CodingKey {
        case rectangle
    }
}

extension QBRectangleImage {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let string = try? container.decode(String.self, forKey: .rectangle) {
      rectangle = string
    } else if let stringArray = try? container.decode([String].self, forKey: .rectangle), let string = stringArray.first {
      rectangle = string
    } else {
      rectangle = ""
    }
  }
}
