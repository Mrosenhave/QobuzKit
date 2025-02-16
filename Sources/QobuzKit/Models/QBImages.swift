//
//  QBAlbumImage.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBImages: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        small = try container.decode(String.self, forKey: .small)
        large = try container.decode(String.self, forKey: .large)
        back = try container.decodeIfPresent(String.self, forKey: .back)
        thumbnail = large.replacingOccurrences(of: "_600", with: "_50")
        original = large.replacingOccurrences(of: "_600", with: "_org")
    }
    
    var small: String
    var thumbnail: String
    var large: String
    var original: String
    var back: String?
    
    enum CodingKeys: String, CodingKey {
        case small
//        case thumbnail
        case large
        case back
    }
}
