//
//  SessionStart.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 25/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Starts a session
   
   - Parameter profile: defines the options used to derive the session shared secret key
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   
   - Returns: A QBSession object.
  */
  public struct SessionStart: Endpoint {
    public init(
      appSecret: String,
      profile: QBSessionProfile
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.profile(), value: profile.rawValue)]
      self.parameters.append(contentsOf: self.signRequest(appSecret: appSecret))
    }

    public typealias Response = QBSession

    public let path: String = "session/start"

    public var parameters: [URLQueryItem]
    
    
  }
}
