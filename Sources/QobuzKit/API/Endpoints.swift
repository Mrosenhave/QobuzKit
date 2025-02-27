//
//  Endpoints.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 21/02/2025.
//

public extension QobuzAPI {
  
  //MARK: Endpoints here
  enum Endpoints {
  }
  
  enum Parameters: String, CaseIterable {
      case albumId = "album_id"
      case albumIds = "album_ids"
      case appId = "app_id"
      case articleId = "article_id"
      case articleIds = "article_ids"
      case artistId = "artist_id"
      case artistIds = "artist_ids"
      case birthdate = "birthdate"
      case birthdateDay = "birthdate_day"
      case birthdateMonth = "birthdate_month"
      case birthdateYear = "birthdate_year"
      case clientId = "client_id"
      case clientSecret = "client_secret"
      case description = "description"
      case deviceManufacturerId = "device_manufacturer_id"
      case deviceModel = "device_model"
      case deviceOsVersion = "device_os_version"
      case devicePlatform = "device_platform"
      case email = "email"
      case extra = "extra"
      case flat = "flat"
      case filter = "filter"
      case formatId = "format_id"
      case genreId = "genre_id"
      case genreIds = "genre_ids"
      case gender = "gender"
      case intent = "intent"
      case itemId = "item_id"
      case isCollaborative = "is_collaborative"
      case isPublic = "is_public"
      case insertBefore = "insert_before"
      case labelId = "label_id"
      case limit = "limit"
      case name = "name"
      case noDuplicate = "no_duplicate"
      case offset = "offset"
      case order = "order"
      case orderId = "order_id"
      case orderLineId = "order_line_id"
      case parentId = "parent_id"
      case password = "password"
      case playerSettings = "player_settings"
      case playlistId = "playlist_id"
      case playlistIds = "playlist_ids"
      case playlistTrackIds = "playlist_track_ids"
      case partnersOptin = "partners_optin"
      case profile = "profile"
      case query = "query"
      case requestSig = "request_sig"
      case requestTs = "request_ts"
      case rubricIds = "rubric_ids"
      case source = "source"
      case sort = "sort"
      case since = "since"
      case sample = "sample"
      case sessionId = "session_id"
      case releaseType = "release_type"
      case trackId = "track_id"
      case trackIds = "track_ids"
      case tracksId = "tracks_id"
      case trackSize = "track_size"
      case tags = "tags"
      case type = "type"
      case userId = "user_id"
      case username = "username"
      case supplierId = "supplier_id"
    
    func callAsFunction() -> String {
      return self.rawValue
    }
  }
}
