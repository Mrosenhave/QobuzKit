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
      case AlbumId = "album_id"
      case AlbumIds = "album_ids"
      case AppId = "app_id"
      case ArticleId = "article_id"
      case ArtistId = "artist_id"
      case ArtistIds = "artist_ids"
      case Description = "description"
      case Email = "email"
      case Extra = "extra"
      case Flat = "flat"
      case FormatId = "format_id"
      case GenreId = "genre_id"
      case GenreIds = "genre_ids"
      case Intent = "intent"
      case ItemId = "item_id"
      case IsCollaborative = "is_collaborative"
      case IsPublic = "is_public"
      case LabelId = "label_id"
      case Limit = "limit"
      case Name = "name"
      case Offset = "offset"
      case Order = "order"
      case OrderId = "order_id"
      case OrderLineId = "order_line_id"
      case ParentId = "parent_id"
      case Password = "password"
      case PlayerSettings = "player_settings"
      case PlaylistId = "playlist_id"
      case PlaylistIds = "playlist_ids"
      case PlaylistTrackIds = "playlist_track_ids"
      case Query = "query"
      case RequestSig = "request_sig"
      case RequestTs = "request_ts"
      case RubricIds = "rubric_ids"
      case Source = "source"
      case Sort = "sort"
      case ReleaseType = "release_type"
      case TrackId = "track_id"
      case TrackIds = "track_ids"
      case TracksId = "tracks_id"
      case Tags = "tags"
      case type = "type"
      case UserId = "user_id"
      case Username = "username"
    
    func callAsFunction() -> String {
      return self.rawValue
    }
  }
}
