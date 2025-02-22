//
//  QBRadioLabel.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

// MARK: - Label
public struct QBLabel: Codable {
    public let id: Int
    public let name: String
  public let albums: QBItems<QBAlbum>?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case albums
    }
}

public struct QBLabelList: Codable {
    public let lables: QBItems<QBGenre>
}
