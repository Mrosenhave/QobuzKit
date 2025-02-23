//
//  QBUserPurchasesIds.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation

public struct QBUserPurchasesIds: Codable, Equatable {
  public init(albums: [String], tracks: [Int], user: QBUserIdLogin) {
    self.albums = albums
    self.tracks = tracks
    self.user = user
  }
  
  public let albums: [String]
    public let tracks: [Int]
  public let user: QBUserIdLogin
}
