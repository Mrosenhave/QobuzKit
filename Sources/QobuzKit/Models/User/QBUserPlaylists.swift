//
//  QBUserPlaylists.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 17/06/2024.
//

import Foundation

struct QBUserPlaylists: Codable {
    let user: QBUserIdLogin
    let playlists: QBItems<QBPlaylist>
}
