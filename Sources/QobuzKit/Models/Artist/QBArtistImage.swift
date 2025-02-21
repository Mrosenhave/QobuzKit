//
//  QBArtistImage.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBArtistImage: Codable, Equatable {
    public let small: String?
    public let medium: String?
    public let large: String?
    public let extralarge: String?
    public let mega: String?
    
    enum CodingKeys: String, CodingKey {
        case small
        case medium
        case large
        case extralarge
        case mega
    }
}
