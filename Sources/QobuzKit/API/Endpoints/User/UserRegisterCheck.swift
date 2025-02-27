//
//  UserRegisterCheck.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 25/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Check if email is taken
   
   - Parameter email: The provided email
   
   ## Authentication
   Requires a valid app_id.
   
   
   - Returns: A QBUser object.
  */
  public struct UserRegisterCheck: Endpoint {
    public init(
      email: String
    ) {
      self.parameters = [.init(name: QobuzAPI.Parameters.email(), value: email)]
    }

    public typealias Response = QBStatus

    public let path: String = "user/registerCheck"

    public var parameters: [URLQueryItem]
  }
}
