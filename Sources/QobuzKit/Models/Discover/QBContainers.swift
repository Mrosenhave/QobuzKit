//
//  QBContainers.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - Containers
struct QBContainers: Codable {
//    let banners: Banners
    let newReleases, recentReleases, qobuzissims, idealDiscography: QBDiscoverData<QBHasMoreItems<QBAlbum>>
    let albumOfTheWeek, mostStreamed, pressAwards: QBDiscoverData<QBHasMoreItems<QBAlbum>>
    let playlists: QBDiscoverData<QBHasMoreItems<QBPlaylist>>
    let playlistsTags: QBDiscoverData<QBHasMoreItems<QBTagElement>>

    enum CodingKeys: String, CodingKey {
//        case banners
        case newReleases = "new_releases"
        case recentReleases = "recent_releases"
        case qobuzissims
        case idealDiscography = "ideal_discography"
        case albumOfTheWeek = "album_of_the_week"
        case mostStreamed = "most_streamed"
        case pressAwards = "press_awards"
        case playlists
        case playlistsTags = "playlists_tags"
    }
}
