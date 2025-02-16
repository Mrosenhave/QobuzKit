//
//  QBUserFavorites.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 17/06/2024.
//

import Foundation

struct QBUserFavorites: Codable {
    let albums: QBItems<QBAlbum>
    let artists: QBItems<QBArtist>
    let tracks: QBItems<QBTrack>
    let user: QBUserIdLogin
}

struct QBUserIdLogin: Codable {
    let id: Int
    let login: String
}
