//
//  Client+getBundle.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 18/02/2025.
//

import Foundation
import RegexBuilder

extension QobuzClient {
  public func getBundle() async -> String? {
    // get site data
    guard let loginURL = URL(string: "https://play.qobuz.com/login") else {
      print("getBundle ERROR: Failed getting loginURL")
      return nil
    }
    
    guard let loginPage: String = await getContentsOfUrl(from: loginURL) else {
      print("getBundle ERROR: failed getting loginPage")
      return nil
    }
    
    // Regex
    guard let bundleRegex = try? NSRegularExpression(
        pattern: "<script src=\"(/resources/\\d+\\.\\d+\\.\\d+-[a-z]\\d{3}/bundle\\.js)\"></script>",
        options: []
    ) else {
      print("getBundle ERROR: Failed building regex")
      return nil
    }
    let bundleMatch = bundleRegex.firstMatch(in: loginPage, options: [], range: NSRange(location: 0, length: loginPage.count))
    guard let bundleMatch else {
      print("getBundle ERROR: bundleMatch is nil")
      return nil
    }
    let bundleRange = bundleMatch.range(at: 1)
    guard let pathRange = Range(bundleRange, in: loginPage) else {
      print("getBundle ERROR: pathRange is nil")
      return nil
    }
    guard let bundleURL = URL(string: "https://play.qobuz.com")?.appending(path: String(loginPage[pathRange])) else {
      print("getBundle ERROR: Failed getting bundleURL")
      return nil
    }
    return await getContentsOfUrl(from: bundleURL)
  }
}
