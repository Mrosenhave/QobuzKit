//
//  Label.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Get details for a music label.
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter labelId: The label id
   - Parameter extra: Extra desired information.
   - Parameter limit: Maximum number of labels to return (default: 25, max: 500)
   - Parameter offset: Offset of the first label (default: 0)
   
   - Returns: A QBLabel object.
  */
  public struct Label: Endpoint {
    public init(
      labelId: Int,
      extra: labelExtra...,
      limit: Int? = nil,
      offset: Int? = nil
    ) {
      self.parameters = [
        .init(name: QobuzAPI.Parameters.labelId(), value: String(labelId))
      ]
      let extraString = extra.map({$0.rawValue}).joined(separator: ",")
      self.parameters.append(.init(name: QobuzAPI.Parameters.extra(), value: extraString))
      
      if let limit {
        self.parameters.append(.init(name: QobuzAPI.Parameters.limit(), value: String(limit)))
      }
      if let offset {
        self.parameters.append(.init(name: QobuzAPI.Parameters.offset(), value: String(offset)))
      }
    }

    public typealias Response = QBLabel

    public let path: String = "label/get"

    public var parameters: [URLQueryItem]
    
    public enum labelExtra: String {
      case albums
      case focus
      case focusAll
    }
  }
}
