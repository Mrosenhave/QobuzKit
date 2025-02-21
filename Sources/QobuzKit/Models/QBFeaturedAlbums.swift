//
//  QBFeaturedAlbums.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBFeaturedAlbums: Codable {
    public let containers: Containers?
    
    enum CodingKeys: String, CodingKey {
        case containers
    }
}

public struct Containers: Codable {
    public let containerAlbumNewReleasesFull: Container
    public let containerAlbumRecentReleases: Container
    public let containerAlbumPressAwards: Container
    public let containerAlbumCharts: Container
    public let containerAlbumOfTheWeek: Container
    
    enum CodingKeys: String, CodingKey {
        case containerAlbumNewReleasesFull = "container-album-new-releases-full"
        case containerAlbumRecentReleases = "container-album-recent-releases"
        case containerAlbumPressAwards = "container-album-press-awards"
        case containerAlbumCharts = "container-album-charts"
        case containerAlbumOfTheWeek = "container-album-of-the-week"
    }
}

public struct Container: Codable {
    public let label: String
    public let baseline: String
    public let albums: QBItems<QBAlbum>
    
    enum CodingKeys: String, CodingKey {
        case label
        case baseline
        case albums
    }
}
