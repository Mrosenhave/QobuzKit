//
//  Client+getAppId.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 18/02/2025.
//

import Foundation
import RegexBuilder
extension QobuzCredential {
  public func getAppId(_ bundle: String) -> String? {
      let appIdRef = Reference(Int.self)
      let appSecretRef = Reference(String.self)
      let appIdRegex = Regex{
          "production:{api:{appId:\""
          TryCapture(as: appIdRef) {
                  OneOrMore(.digit)
              } transform: { match in
                  Int(match)
              }
          "\",appSecret:\""
          TryCapture(as: appSecretRef) {
                  OneOrMore(.word)
              } transform: { match in
                  String(match)
              }
          "\"}"
      }
      let match = bundle.firstMatch(of: appIdRegex)
      guard let match else {
        print("getAppId ERROR: Failed to match regex")
          return nil
      }
      return String(match[appIdRef])
  }
}
