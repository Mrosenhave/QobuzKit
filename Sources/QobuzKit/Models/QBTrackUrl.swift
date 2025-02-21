//
//  QBTrackUrl.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBTrackUrl: Codable {
  public init(trackId: Int, duration: Int, url: URL? = nil, formatId: Int? = nil, mimeType: String? = nil, restrictions: [QBTrackURLRestriction]? = nil, samplingRate: Double, bitDepth: Int) {
    self.trackId = trackId
    self.duration = duration
    self.url = url
    self.formatId = formatId
    self.mimeType = mimeType
    self.restrictions = restrictions
    self.samplingRate = samplingRate
    self.bitDepth = bitDepth
  }
  
    
    public var trackId: Int
    public var duration: Int
    public var url: URL?
    public var formatId: Int?
    public var mimeType: String?
    public var restrictions: [QBTrackURLRestriction]?
    public var samplingRate: Double
    public var bitDepth: Int
    
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
    public init(from decoder: Decoder) throws {
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

public struct QBTrackURLRestriction: Codable {
    public let code: String
}
