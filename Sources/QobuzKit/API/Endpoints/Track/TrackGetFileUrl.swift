//
//  TrackGetFileUrl.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Return the file url and the duration (in seconds) of the track. Requires a valid request signature and user
   authentication to access full-length track. The file format is granted according to your request, your
   credential rights and the availability of the product: the method may deliver a downgraded format due to the
   two last settings.
   
   ## Authentication
   Requires a valid app_id and user_auth_token and a signature.
   This endpoint must be signed by sending both requestTs and requestSig parameters.
   
   - Parameter trackId: The track ID to fetch the URL of.
   - Parameter formatId: The format to fetch
   - Parameter intent: How the application will use the file URL
   - Parameter sample: Force sample
   - Parameter appSecret: Your app secret
   
   - Returns: A QBTrackUrl object.
  */
  public struct TrackGetFileUrl: Endpoint {
    public init(
      trackId: Int,
      formatId: trackFormat,
      intent: trackIntent,
      appSecret: String,
      sample: Bool? = nil
    ) {
      self.parameters = [
        .init(name: QobuzAPI.Parameters.trackId(), value: String(trackId)),
        .init(name: QobuzAPI.Parameters.formatId(), value: String(formatId.rawValue)),
        .init(name: QobuzAPI.Parameters.intent(), value: intent.rawValue)
      ]
      if let sample {
        self.parameters.append(.init(name: QobuzAPI.Parameters.sample(), value: String(sample)))
      }
      self.parameters.append(contentsOf: self.signRequest(appSecret: appSecret))
    }

    public typealias Response = QBTrackUrl

    public let path: String = "track/getFileUrl"

    public var parameters: [URLQueryItem]
    
    
    public enum trackFormat: Int {
      /// MP3 320Mb/s
      case lossy = 5
      /// FLAC Lossless
      case lossless = 6
      /// FLAC Hi-Res 24 bit =\< 96kHz
      case hiResMid = 7
      /// FLAC Hi-Res 24 bit >96 kHz & =\< 192 kHz
      case hiResBest = 27
    }
    
    public enum trackIntent: String {
      case stream
      case `import`
      case download
    }
    
    
  }
}
