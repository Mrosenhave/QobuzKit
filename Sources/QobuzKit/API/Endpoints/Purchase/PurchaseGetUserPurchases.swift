//
//  PurchaseGetUserPurchases.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the articles (albums and tracks) purchased by the authenticated user on the Qobuz music store.
   
   Shows the downloadable format_id of the purchases which can be used in the call **TrackGetFileUrl**.
   Note : For preordered product the node downloadable_format_ids is empty.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter type: The purchase type
   - Parameter flat: If true, returns all articles as tracks
   - Parameter orderId: Returns articles associated with the order
   - Parameter orderLineId: Returns the article associated with the given order line
   - Parameter since: Return articles delivered after specified date
   - Parameter limit: Maximum number of articles (default: 50, max: 500)
   - Parameter offset: Offset of the first article (default: 0)
   
   - Returns: A QBSearch object with tracks or albums or both.
  */
  public struct PurchaseGetUserPurchases: Endpoint {
    public init(
      type: purchaseType? = nil,
      flat: Bool? = nil,
      orderId: String? = nil,
      orderLineId: String? = nil,
      since: Date? = nil,
      limit: Int? = nil,
      offset: Int? = nil
    ) {
      self.parameters = [URLQueryItem]()
      if let type {
        self.parameters.append(.init(name: QobuzAPI.Parameters.type(), value: type.rawValue))
      }
      if let flat {
        self.parameters.append(.init(name: QobuzAPI.Parameters.flat(), value: String(flat)))
      }
      if let orderId {
        self.parameters.append(.init(name: QobuzAPI.Parameters.orderId(), value: orderId))
      }
      if let orderLineId {
        self.parameters.append(.init(name: QobuzAPI.Parameters.orderLineId(), value: orderLineId))
      }
      if let since {
        self.parameters.append(.init(name: QobuzAPI.Parameters.since(), value: String(Int(since.timeIntervalSince1970))))
      }
      if let limit {
        self.parameters.append(.init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(.init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
    }

    public typealias Response = QBSearch

    public let path: String = "purchase/getUserPurchases"

    public var parameters: [URLQueryItem]
    
    public enum purchaseType: String {
      case albums
      case tracks
    }
  }
}
