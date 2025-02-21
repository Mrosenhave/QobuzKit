//
//  QBRights.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public struct QBRights: Codable {
    public let purchasable, streamable, downloadable, hiresStreamable: Bool
    public let hiresPurchasable: Bool?
    public let hires: Bool?
    public let sampleable: Bool?
    public let previewable: Bool?
    public let streamableAt: Int?

    enum CodingKeys: String, CodingKey {
        case purchasable, streamable, downloadable, hires, sampleable, previewable
        case hiresStreamable = "hires_streamable"
        case hiresPurchasable = "hires_purchasable"
        case streamableAt = "streamable_at"
    }
}
