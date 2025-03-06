//
//  ApiEndpoint+constructURL.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

public extension Endpoint {
  func constructURL() -> URL? {
    var components = URLComponents(
      url: baseURL
        .appendingPathComponent(path), resolvingAgainstBaseURL: false)

    components?.queryItems = parameters.sorted { $0.name < $1.name }
    

    return components?.url
  }
}
