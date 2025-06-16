//
//  QobuzClient+generateCredentials.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 16/06/2025.
//

import Foundation

public extension QobuzClient {
  @MainActor func generateCredentials() async {
    let QBC = QobuzCredential()
    guard let bundle = await QBC.getBundle() else {
      print("Failed to get bundle")
      return
    }
    guard let appId = QBC.getAppId(bundle), let appSecret = QBC.getSecrets(bundle)?.last else {
      print("Failed to get appId or appSecret")
      return
    }
    self.setCredentials(appId: appId, appSecret: appSecret)
  }
}
