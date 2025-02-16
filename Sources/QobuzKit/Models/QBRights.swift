//
//  QBRights.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

struct QBRights: Codable {
    let purchasable, streamable, downloadable, hiresStreamable: Bool
    let hiresPurchasable: Bool?
    let hires: Bool?
    let sampleable: Bool?
    let previewable: Bool?
    let streamableAt: Int?

    enum CodingKeys: String, CodingKey {
        case purchasable, streamable, downloadable, hires, sampleable, previewable
        case hiresStreamable = "hires_streamable"
        case hiresPurchasable = "hires_purchasable"
        case streamableAt = "streamable_at"
    }
}
