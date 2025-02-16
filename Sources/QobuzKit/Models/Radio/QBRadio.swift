//
//  QBRadio.swift
//  QoRipMobile
//
//  Created by Markus Rosenhave on 10/01/2024.
//

import Foundation

// MARK: - QBRadio
struct QBRadio: Codable {
    let algorithm, type, title: String
    let images: QBImages
    let duration, trackCount: Int
    let tracks: QBItems<QBRadioTrack>

    enum CodingKeys: String, CodingKey {
        case algorithm, type, title, images, duration
        case trackCount = "track_count"
        case tracks
    }
}

enum radioType: String {
    case artist/* = "radio-artist"*/
    case album/* = "radio-album"*/
    case track/* = "radio-track"*/
}

