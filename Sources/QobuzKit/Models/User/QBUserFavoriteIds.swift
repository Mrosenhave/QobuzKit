//
//  QBUserFavoriteIds.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 24/06/2024.
//

import Foundation

struct QBUserFavoriteIds: Codable, Equatable {
  let albums: [String]
    let artists: [Int]
    let tracks: [Int]
}
