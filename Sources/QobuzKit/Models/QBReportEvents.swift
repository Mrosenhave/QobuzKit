//
//  QBReportEvents.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

public struct QBReportEvents: Codable {
  public let events: [QBTrackReport]
  enum CodingKeys: String, CodingKey {
    case events
  }
}
