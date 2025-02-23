//
//  QBTrackReport.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

public struct QBTrackReport: Codable {
  public let userId: String
  public let trackId: Int
  public let formatId: Int
  public let date: Int
  public let duration: Int
  public let online: Bool
  public let local: Bool
  public let deviceId: String?
  public let credentialId: String?
  public let intent: String?
  public let purchase: Bool?
  public let sample: Bool?
  enum CodingKeys: String, CodingKey {
    case userId = "user_id"
    case trackId = "track_id"
    case formatId = "format_id"
    case date
    case duration
    case online
    case local
    case deviceId = "device_id"
    case credentialId = "credential_id"
    case intent
    case purchase
    case sample
  }
}
