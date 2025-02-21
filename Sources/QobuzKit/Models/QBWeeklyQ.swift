//
//  QBWeeklyQ.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - WeeklyQ
public struct QBWeeklyQ: Codable {
    public let title, baseline, description, type: String
    public let stepPagination: Int
    public let images: QBImages
    public let graphics: QBGraphics
    public let duration, generatedAt, expiresOn, trackCount: Int
    public let tracks: QBItems<QBTrack>

    enum CodingKeys: String, CodingKey {
        case title, baseline, description, type
        case stepPagination = "step_pagination"
        case images, graphics, duration
        case generatedAt = "generated_at"
        case expiresOn = "expires_on"
        case trackCount = "track_count"
        case tracks
    }
}

// MARK: - Graphics
public struct QBGraphics: Codable {
    public let background, foreground: String
    
    enum CodingKeys: String, CodingKey {
        case background
        case foreground
    }
}
