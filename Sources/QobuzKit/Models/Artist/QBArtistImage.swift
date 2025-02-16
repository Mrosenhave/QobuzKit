//
//  QBArtistImage.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBArtistImage: Codable, Equatable {
    let small: String?
    let medium: String?
    let large: String?
    let extralarge: String?
    let mega: String?
    
    enum CodingKeys: String, CodingKey {
        case small
        case medium
        case large
        case extralarge
        case mega
    }
}
