//
//  QBReleaseType.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public enum QBReleaseType: String, Codable {
    case album = "album"
    case bestof = "bestof"
    case single = "single"
    case compilation = "compilation"
    case live = "live"
    case epSingle = "epSingle"
    case boxset = "boxset"
    case epmini = "epmini"
    case download = "download"
    case other = "other"
}
