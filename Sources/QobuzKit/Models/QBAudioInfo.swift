//
//  QBAudioInfo.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation
struct QBAudioInfo: Codable {
    let replaygainTrackPeak: Double?
    let replaygainTrackGain: Double?
    let maximumSamplingRate: Double?
    let maximumBitDepth: Int?
    let maximumChannelCount: Int?

    enum CodingKeys: String, CodingKey {
        case replaygainTrackPeak = "replaygain_track_peak"
        case replaygainTrackGain = "replaygain_track_gain"
        case maximumSamplingRate = "maximum_sampling_rate"
        case maximumBitDepth = "maximum_bit_depth"
        case maximumChannelCount = "maximum_channel_count"
    }
}
