//
//  Endpoint.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

public protocol Endpoint {
    associatedtype Response: Decodable
  var path: String { get }
  var parameters: [URLQueryItem] { get }
    var body: Data? { get }  // For POST request data

    func constructURL() -> URL?
  }


public extension Endpoint {
  //Default Values
  var body: Data? { nil }
}
