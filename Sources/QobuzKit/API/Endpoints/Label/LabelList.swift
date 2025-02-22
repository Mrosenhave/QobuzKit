//
//  LabelList.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Lists all the labels available on Qobuz.
   
   **This endpoint is DEPRECATED**
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter limit: Maximum number of genres (default: 25, max: 100)
   - Parameter offset: Offset of the first genre (default: 0)
   
   - Returns: A QBLabelList object.
  */
  public struct LabelList: Endpoint {
    public init(
      limit: Int? = nil,
      offset: Int? = nil
    ) {
      self.parameters = [URLQueryItem]()
      if let limit {
        self.parameters.append(.init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(.init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
      
    }

    public typealias Response = QBLabelList

    public let path: String = "label/list"

    public var parameters: [URLQueryItem]
  }
}
