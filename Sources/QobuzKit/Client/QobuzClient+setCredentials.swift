//
//  QobuzClient+setCredentials.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/06/2025.
//

public extension QobuzClient {
  @MainActor
  func setCredentials(appId: String, appSecret: String) {
    self.appId = appId
    self.appSecret = appSecret
  }
}
