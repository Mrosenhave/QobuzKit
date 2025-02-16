//
//  QBRectangleImage.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

struct QBRectangleImage: Codable {
    let rectangle: String
    
    enum CodingKeys: String, CodingKey {
        case rectangle
    }
}

extension QBRectangleImage {
  init(from decoder: Decoder) throws {
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
