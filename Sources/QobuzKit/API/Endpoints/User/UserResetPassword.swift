//
//  UserResetPassword.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Send email instructions to allow password reset.
   
   - Parameter username: The username or email
   
   ## Authentication
   Requires a valid app_id.
   
   
   - Returns: A QBUser object.
  */
  public struct UserResetPassword: Endpoint {
    public init(
      username: String
    ) {
      self.parameters = [
        .init(name: QobuzAPI.Parameters.username(), value: username)
      ]
    }

    public typealias Response = QBStatus

    public let path: String = "user/resetPassword"

    public var parameters: [URLQueryItem]
  }
}
