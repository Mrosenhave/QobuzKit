//
//  ApiEndpoint.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

extension QobuzAPI {
  protocol Endpoint {
    associatedtype Response: Decodable
    var path: String { get }
    var parameters: [String: Any] { get }
    var body: Data? { get }  // For POST request data

    func constructURL() -> URL?
  }
}

extension QobuzAPI.Endpoint {
  //Default Values
  var body: Data? { nil }
}
