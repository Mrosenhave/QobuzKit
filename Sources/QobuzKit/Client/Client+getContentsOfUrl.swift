//
//  Client+getContentsOfUrl.swift
//
//
//  Created by Markus Rosenhave on 18/02/2025.
//

import Foundation

extension QobuzClient {
    func getContentsOfUrl(from url: URL) async -> String? {
        // Create a URL request
        let request = URLRequest(url: url)
        
        // Use URLSession to fetch data asynchronously
      guard let (data, _) = try? await URLSession.shared.data(for: request) else {
        return nil
      }
        
        // Convert the data to a String and return it
        guard let pageContent = String(data: data, encoding: .utf8) else {
            return nil
        }
        
        return pageContent
    }
}
