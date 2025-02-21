//
//  ApiEndpoint+constructURL.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

extension QobuzAPI.Endpoint {
  func constructURL() -> URL? {
    let baseURL: String = "https://www.qobuz.com/api.json/0.2/"
    var components = URLComponents(
      url: URL(string: baseURL)!
        .appendingPathComponent(path), resolvingAgainstBaseURL: false)

    if let parameters = parameters as? [String: String] {
      components?.queryItems = parameters.sorted { $0.key < $1.key }.map {
        URLQueryItem(name: $0.key, value: $0.value)
      }
    }

    return components?.url
  }
}
