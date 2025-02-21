//
//  hashStringToImageModel.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public func hashStringToImageModel(hash: String, format: String) -> QBArtistImage {
    let smallUrl = "https://static.qobuz.com/images/artists/covers/small/\(hash).\(format)"
    let mediumUrl = "https://static.qobuz.com/images/artists/covers/medium/\(hash).\(format)"
    let largeUrl = "https://static.qobuz.com/images/artists/covers/large/\(hash).\(format)"
    let imageObject = QBArtistImage(small: smallUrl, medium: mediumUrl, large: largeUrl, extralarge: largeUrl, mega: largeUrl)
    return imageObject
}
