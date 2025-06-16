//
//  QobuzClient+request.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 21/02/2025.
//

import Foundation

extension QobuzClient {
  /// Sends a request to the given endpoint with an optional authentication token.
  public func request<T: Endpoint>(_ endpoint: T, token: String? = nil)
    async throws -> T.Response
  {
    guard let url = endpoint.constructURL() else {
      throw NetworkError.invalidURL
    }

    var request = URLRequest(url: url)
    if let body = endpoint.body {
      request.httpMethod = "POST"
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      request.httpBody = body
    } else {
      request.httpMethod = "GET"
    }

    request.addValue(self.appId, forHTTPHeaderField: "X-App-Id")

    // Add authentication token if provided
    if let token {
      request.setValue(token, forHTTPHeaderField: "X-User-Auth-Token")
    }

    do {
      let (data, response) = try await URLSession.shared.data(for: request)

      guard let httpResponse = response as? HTTPURLResponse else {
        throw NetworkError.invalidResponse
      }

      // Check the status code and throw matching errors
      switch httpResponse.statusCode {
      case 200:
        // Everything worked as expected
        break
      case 400:
        let errorResponse = try? JSONDecoder().decode(QBError.self, from: data)
        throw NetworkError.badRequest(
          message: errorResponse?.message ?? "Bad request")
      case 401:
        let errorResponse = try? JSONDecoder().decode(QBError.self, from: data)
        throw NetworkError.unauthorized(
          message: errorResponse?.message ?? "Unauthorized")
      case 402:
        let errorResponse = try? JSONDecoder().decode(QBError.self, from: data)
        throw NetworkError.requestFailed(
          message: errorResponse?.message ?? "Request failed")
      case 404:
        let errorResponse = try? JSONDecoder().decode(QBError.self, from: data)
        throw NetworkError.notFound(
          message: errorResponse?.message ?? "Not found")
      case 405:
        let errorResponse = try? JSONDecoder().decode(QBError.self, from: data)
        throw NetworkError.badRequest(
          message: errorResponse?.message ?? "405 Error")
      case 500...599:
        let errorResponse = try? JSONDecoder().decode(QBError.self, from: data)
        throw NetworkError.serverError(
          message: errorResponse?.message ?? "Server error")
      default:
        throw NetworkError.invalidResponse
      }

      // Attempt to decode the response body into the expected type
      let decodedResponse = try JSONDecoder().decode(
        T.Response.self, from: data)
      return decodedResponse

    } catch {
      throw error
    }
  }

  /// Convenience method to call the request function without a token.
  public func request<T: Endpoint>(_ endpoint: T) async throws -> T.Response {
    return try await request(endpoint, token: nil)
  }
}

// MARK: - Network Errors
public enum NetworkError: Error {
  case invalidURL
  case invalidResponse
  case decodingError(Error)
  case badRequest(message: String)
  case unauthorized(message: String)
  case requestFailed(message: String)
  case notFound(message: String)
  case serverError(message: String)
}
