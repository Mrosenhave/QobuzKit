//
//  ApiEndpoint+constructURL.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

public extension Endpoint {
  func constructURL() -> URL? {
    let baseURL: String = "https://www.qobuz.com/api.json/0.2/"
    var components = URLComponents(
      url: URL(string: baseURL)!
        .appendingPathComponent(path), resolvingAgainstBaseURL: false)

    components?.queryItems = parameters.sorted { $0.name < $1.name }
    

    return components?.url
  }
}
