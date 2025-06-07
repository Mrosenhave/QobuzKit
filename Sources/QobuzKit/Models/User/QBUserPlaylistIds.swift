//
//  QBUserPlaylistIds.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 18/07/2024.
//

import Foundation

public struct QBUserPlaylistIds: Codable, Equatable {
  public init(playlists: [Int]) {
    self.playlists = playlists
  }
  
    public var playlists: [Int]
}
