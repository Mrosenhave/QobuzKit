//
//  ApiEndpoint.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

extension QobuzAPI {
  protocol ApiEndpoint {
    associatedtype Response: Decodable
    var path: String { get }
    var method: HTTPMethod { get }
    var requiresAuth: Bool { get }
    var parameters: [String: Any] { get }
    var body: Data? { get }  // For POST request data

    func constructURL() -> URL?
  }
}

extension QobuzAPI.ApiEndpoint {
  //Default Values
  var method: QobuzAPI.HTTPMethod { .get }
  var requiresAuth: Bool { false }
  
  var body: Data? { nil }
}
