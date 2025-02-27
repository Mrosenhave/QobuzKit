//
//  AppStoreOfferEligibility.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 24/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return any subscription offers for the authenticated user
   **NB: Probably only works with specific appId and appSecret**
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   
   - Returns: A QBOffers object.
  */
  public struct AppStoreOfferEligibility: Endpoint {
    public init(
      appSecret: String
    ) {
      self.parameters = [URLQueryItem]()
      self.parameters.append(contentsOf: self.signRequest(appSecret: appSecret))
    }

    public typealias Response = QBOffers

    public let path: String = "appStore/offerEligibility"

    public var parameters: [URLQueryItem]
  }
}
