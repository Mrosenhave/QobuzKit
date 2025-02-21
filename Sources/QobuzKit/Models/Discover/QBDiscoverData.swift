//
//  QBDiscoverData.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

public struct QBDiscoverData<T: Codable>: Codable {
    public let id: QBDiscoverType
    public let data: T
}
