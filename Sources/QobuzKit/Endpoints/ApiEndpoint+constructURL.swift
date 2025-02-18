//
//  ApiEndpoint+constructURL.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

extension QobuzAPI.ApiEndpoint {
  func constructURL() -> URL? {
    var components = URLComponents(
      url: URL(string: QobuzAPI.statics.baseURL.rawValue)!
        .appendingPathComponent(path), resolvingAgainstBaseURL: false)

    if let parameters = parameters as? [String: String] {
      components?.queryItems = parameters.map {
        URLQueryItem(name: $0.key, value: $0.value)
      }
    }

    return components?.url
  }
}
