//
//  Album.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 21/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  public struct Album: Endpoint {
    
    public init(albumId: String, extra: [Album.albumExtra]?) {
      self.parameters = [URLQueryItem(name: QobuzAPI.Parameters.AlbumId(), value: albumId)]
      if let extra {
        self.parameters?.append(URLQueryItem(name: QobuzAPI.Parameters.Extra(), value: extra.map({$0.rawValue}).joined(separator: ",")))
      }
    }
    

    public typealias Response = QBAlbum

    public var path: String = "album/get"

    public var parameters: [URLQueryItem]?

    public enum albumExtra: String, CaseIterable {
      case trackIds = "track_ids"
      case albumsSameArtist = "albumsFromSameArtist"
      case focus = "focus"
      case focusAll = "focusAll"
    }
  }
}
