// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import os

public final class QobuzAPI {
  //MARK: Declare endpoints here
}

public class QobuzClient:ObservableObject {
  @MainActor public static let shared = QobuzClient (appId: "", appSecret: "")
  public init(appId: String, appSecret: String) {
    self.appId = appId
    self.appSecret = appSecret
  }
  
  @Published public var appId: String
  @Published public var appSecret: String
  
 
  //MARK: Make network requests here
}

public struct QobuzCredential {
  //MARK: Get app credentials here
}
