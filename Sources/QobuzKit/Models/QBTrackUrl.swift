//
//  QBTrackUrl.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBTrackUrl: Codable {
    
    var trackId: Int
    var duration: Int
    var url: URL?
    var formatId: Int?
    var mimeType: String?
    var restrictions: [QBTrackURLRestriction]?
    var samplingRate: Double
    var bitDepth: Int
    
    enum CodingKeys: String, CodingKey {
        case trackId = "track_id"
        case duration, url
        case formatId = "format_id"
        case mimeType = "mime_type"
        case restrictions
        case samplingRate = "sampling_rate"
        case bitDepth = "bit_depth"
    }
    
}

extension QBTrackUrl {
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            trackId = try container.decode(Int.self, forKey: .trackId)
            duration = try container.decode(Int.self, forKey: .duration)
            url = try container.decodeIfPresent(URL.self, forKey: .url)
            formatId = try container.decodeIfPresent(Int.self, forKey: .formatId)
            mimeType = try container.decodeIfPresent(String.self, forKey: .mimeType)
            restrictions = try container.decodeIfPresent([QBTrackURLRestriction].self, forKey: .restrictions)
            samplingRate = try container.decode(Double.self, forKey: .samplingRate)
            bitDepth = try container.decode(Int.self, forKey: .bitDepth)
        }
}

struct QBTrackURLRestriction: Codable {
    let code: String
}
