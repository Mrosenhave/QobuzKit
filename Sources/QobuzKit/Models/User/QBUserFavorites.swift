//
//  QBUserFavorites.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 17/06/2024.
//

import Foundation

public struct QBUserFavorites: Codable {
    public let albums: QBItems<QBAlbum>
    public let artists: QBItems<QBArtist>
    public let tracks: QBItems<QBTrack>
    public let user: QBUserIdLogin
}

public struct QBUserIdLogin: Codable {
    public let id: Int
    public let login: String
}
