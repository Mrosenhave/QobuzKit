//
//  PurchaseGetUserPurchasesIds.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return list of ALL articles (albums and tracks) purchased by the authenticated user on the Qobuz music
   store.
   
   You will find a list of each albums bought, and a list which contains each tracks from all the albums bought,
   identified by them id.
   Please pay attention: this method is not paginated
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Returns: A QBSearch object with tracks or albums or both.
  */
  public struct PurchaseGetUserPurchasesIds: Endpoint {
    public init() {
      self.parameters = [URLQueryItem]()
    }

    public typealias Response = QBUserPurchasesIds

    public let path: String = "purchase/getUserPurchasesIds"

    public var parameters: [URLQueryItem]
    
  }
}
