//
//  Story.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 27/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Get a story
   
   ## Authentication
   Requires a valid app_id and user_auth_token.
   
   - Parameter storyId: The story id
   - Parameter store: The store region
   
   - Returns: A QBStoryArticle object.
  */
  public struct Story: Endpoint {
    public init(
      storyId: String,
      store: String
    ) {
      self.path = store + "/" + storyId + "/"
    }

    public typealias Response = QBStoryArticle

    public let baseURL: URL = URL(string: "https://qobuz-qobuz-prod.web.arc-cdn.net/arc/outboundfeeds/story/")!
    
    public var path: String

    public let parameters: [URLQueryItem] = [URLQueryItem]()
  }
}
