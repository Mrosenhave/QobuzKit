//
//  SwiftBuzSpoof+getContentsOfUrl.swift
//
//
//  Created by Markus Rosenhave on 08/08/2024.
//

import Foundation

@available(iOS 16.0, macOS 13, *)
extension Spoofer {
    func getContentsOfUrl(from url: URL) async throws -> String {
        // Create a URL request
        let request = URLRequest(url: url)
        
        // Use URLSession to fetch data asynchronously
        let (data, _) = try await URLSession.shared.data(for: request)
        
        // Convert the data to a String and return it
        guard let pageContent = String(data: data, encoding: .utf8) else {
            throw URLError(.badServerResponse)
        }
        
        return pageContent
    }
}
