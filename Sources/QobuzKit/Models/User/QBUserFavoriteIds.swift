//
//  QBUserFavoriteIds.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 24/06/2024.
//

import Foundation

public struct QBUserFavoriteIds: Codable, Equatable {
  public init(albums: [String], artists: [Int], tracks: [Int], articles: [String]) {
    self.albums = albums
    self.artists = artists
    self.tracks = tracks
    self.articles = articles
  }
  
  public var albums: [String]
    public var artists: [Int]
    public var tracks: [Int]
    public var articles: [String]
}
