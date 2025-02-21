// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct QobuzAPI {
  //MARK: Endpoints here
}

public class QobuzClient:ObservableObject {
  @MainActor public static let shared = QobuzClient (appId: "", appSecret: "")
  public init(appId: String, appSecret: String) {
    self.appId = appId
    self.appSecret = appSecret
  }
  
  @Published public var appId: String
  @Published public var appSecret: String
  
  @MainActor public func generateCredentials() async {
    let QBC = QobuzCredential()
    guard let bundle = await QBC.getBundle() else {return}
    guard let appId = QBC.getAppId(bundle), let appSecret = QBC.getSecrets(bundle)?.last else {return}
    self.setCredentials(appId: appId, appSecret: appSecret)
  }
  
  @MainActor
  public func setCredentials(appId: String, appSecret: String) {
    self.appId = appId
    self.appSecret = appSecret
  }
  
  //MARK: Network requests here
}

public struct QobuzCredential {
  //MARK: Get app credentials here
}
