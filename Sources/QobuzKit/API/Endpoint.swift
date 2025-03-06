//
//  Endpoint.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/02/2025.
//

import Foundation

public protocol Endpoint {
    associatedtype Response: Decodable
  var baseURL: URL { get }
  var path: String { get }
  var parameters: [URLQueryItem] { get }
    var body: Data? { get }  // For POST request data

    func constructURL() -> URL?
  }


public extension Endpoint {
  //Default Values
  var baseURL: URL { URL(string: "https://www.qobuz.com/api.json/0.2/")! }
  
  var body: Data? { nil }
}
