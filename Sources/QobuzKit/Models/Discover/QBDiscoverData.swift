//
//  QBDiscoverData.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

struct QBDiscoverData<T: Codable>: Codable {
    let id: QBDiscoverType
    let data: T
}
