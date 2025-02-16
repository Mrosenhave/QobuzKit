//
//  QBWeeklyQ.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - WeeklyQ
struct QBWeeklyQ: Codable {
    let title, baseline, description, type: String
    let stepPagination: Int
    let images: QBImages
    let graphics: QBGraphics
    let duration, generatedAt, expiresOn, trackCount: Int
    let tracks: QBItems<QBTrack>

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
struct QBGraphics: Codable {
    let background, foreground: String
    
    enum CodingKeys: String, CodingKey {
        case background
        case foreground
    }
}
