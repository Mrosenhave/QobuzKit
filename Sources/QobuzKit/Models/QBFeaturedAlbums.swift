//
//  QBFeaturedAlbums.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBFeaturedAlbums: Codable {
    let containers: Containers?
    
    enum CodingKeys: String, CodingKey {
        case containers
    }
}

struct Containers: Codable {
    let containerAlbumNewReleasesFull: Container
    let containerAlbumRecentReleases: Container
    let containerAlbumPressAwards: Container
    let containerAlbumCharts: Container
    let containerAlbumOfTheWeek: Container
    
    enum CodingKeys: String, CodingKey {
        case containerAlbumNewReleasesFull = "container-album-new-releases-full"
        case containerAlbumRecentReleases = "container-album-recent-releases"
        case containerAlbumPressAwards = "container-album-press-awards"
        case containerAlbumCharts = "container-album-charts"
        case containerAlbumOfTheWeek = "container-album-of-the-week"
    }
}

struct Container: Codable {
    let label: String
    let baseline: String
    let albums: QBItems<QBAlbum>
    
    enum CodingKeys: String, CodingKey {
        case label
        case baseline
        case albums
    }
}
