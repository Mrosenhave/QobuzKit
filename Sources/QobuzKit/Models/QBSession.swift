//
//  QBSession.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 25/02/2025.
//

import Foundation

public struct QBSession: Codable {
  public let sessionId: String
  public let profile: QBSessionProfile
  public let infos: String
  public let expiresAt: Int
  enum CodingKeys: String, CodingKey {
    case sessionId = "session_id"
    case profile
    case infos
    case expiresAt = "expires_at"
  }
}

public enum QBSessionProfile: String, Codable{
  case qbz1 = "qbz-1"
}
