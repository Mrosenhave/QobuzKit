//
//  OauthToken.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 25/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Get Oauth2 token
  */
  public struct OauthToken: Endpoint {
    public init(
      client_id: String,
      client_secret: String
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.clientId(), value: client_id),
                         .init(name: QobuzAPI.Parameters.clientSecret(), value: client_secret)]
      
    }

    public typealias Response = QBOauthToken

    public let path: String = "oauth2/token"

    public var parameters: [URLQueryItem]
    
    public enum userLoginExtra: String {
      case partner
    }
  }
}
