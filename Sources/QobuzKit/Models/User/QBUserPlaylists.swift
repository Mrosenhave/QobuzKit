//
//  QBUserPlaylists.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 17/06/2024.
//

import Foundation

public struct QBUserPlaylists: Codable {
    public let user: QBUserIdLogin
    public let playlists: QBItems<QBPlaylist>
}
