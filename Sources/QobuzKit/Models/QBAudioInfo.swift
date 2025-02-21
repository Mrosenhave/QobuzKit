//
//  QBAudioInfo.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation
public struct QBAudioInfo: Codable {
    public let replaygainTrackPeak: Double?
    public let replaygainTrackGain: Double?
    public let maximumSamplingRate: Double?
    public let maximumBitDepth: Int?
    public let maximumChannelCount: Int?

    enum CodingKeys: String, CodingKey {
        case replaygainTrackPeak = "replaygain_track_peak"
        case replaygainTrackGain = "replaygain_track_gain"
        case maximumSamplingRate = "maximum_sampling_rate"
        case maximumBitDepth = "maximum_bit_depth"
        case maximumChannelCount = "maximum_channel_count"
    }
}
