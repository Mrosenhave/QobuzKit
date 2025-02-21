//
//  QBDates.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public struct QBDates: Codable {
    public let download: Date?
    public let original: Date
    public let purchase: Date?
    public let stream: Date?
}

extension QBDates {
    // Custom public initializer to handle date string decoding
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        
        if let dateString = try container.decodeIfPresent(String.self, forKey: .download) {
            download = dateStringFormatter.date(from: dateString) ?? Date()
        } else {
            download = nil
        }
        let dateString = try container.decode(String.self, forKey: .original)
            original = dateStringFormatter.date(from: dateString) ?? Date()
        if let dateString = try container.decodeIfPresent(String.self, forKey: .purchase) {
            purchase = dateStringFormatter.date(from: dateString) ?? Date()
        } else {
            purchase = nil
        }
        if let dateString = try container.decodeIfPresent(String.self, forKey: .stream) {
            stream = dateStringFormatter.date(from: dateString) ?? Date()
        } else {
            stream = nil
        }
    }
    
    // Custom encoding for date objects
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        
        try container.encodeIfPresent(dateStringFormatter.string(from: download ?? Date(timeIntervalSince1970: TimeInterval(0))), forKey: .download)
        try container.encode(dateStringFormatter.string(from: original), forKey: .original)
        try container.encodeIfPresent(dateStringFormatter.string(from: purchase ?? Date(timeIntervalSince1970: TimeInterval(0))), forKey: .purchase)
        try container.encodeIfPresent(dateStringFormatter.string(from: stream ?? Date(timeIntervalSince1970: TimeInterval(0))), forKey: .stream)
    }
    
    enum CodingKeys: String, CodingKey {
        case download, original, purchase, stream
    }
}
