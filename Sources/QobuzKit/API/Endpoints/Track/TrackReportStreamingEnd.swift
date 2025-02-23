//
//  TrackReportStreamingEnd.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation

extension QobuzAPI.Endpoints {
  /**
   Report the end of the streaming of a track.
   
   ## Authentication
   Requires a valid app_id and user_auth_token and signature.
   
   - Parameter userId: The user ID
   - Parameter trackId: The track ID
   - Parameter format: The format of the file
   - Parameter date: When you started listening to the track
   - Parameter duration: How long you listened to the track even if it doesn't match the track metadata
   - Parameter online: Report if the streaming has been processed online or offline.
   - Parameter local: Was the file streamed or played locally
   - Parameter deviceId: The id of the device as returned in the **UserLogin** endpoint
   - Parameter credentialId: The id of the user credentials as returned in the **UserLogin** endpoint
   - Parameter intent: Report if is it a stream or an import of the file.
   - Parameter purchase: Report if the stream has been purchased.
   - Parameter sample: Report if the stream is a sample.
   
   
   
   - Returns: A QBStatus object.
  */
  public struct TrackReportStreamingEnd: Endpoint {
    /// Single report
    public init(
      appSecret: String,
      userId: String,
      trackId: Int,
      format: trackFormat,
      date: Int,
      duration: Int,
      online: Bool,
      local: Bool,
      deviceId: String?,
      credentialId: String?,
      intent: trackIntent?,
      purchase: Bool?,
      sample: Bool?
    ) {
      let report = QBTrackReport(userId: userId, trackId: trackId, formatId: format.rawValue, date: date, duration: duration, online: online, local: local, deviceId: deviceId, credentialId: credentialId, intent: intent?.rawValue, purchase: purchase, sample: sample)
      if let encodedData = try? JSONEncoder().encode(QBReportEvents(events: [report])) {
        self.body = encodedData
      }
      self.parameters = [URLQueryItem]()
      self.parameters = self.signRequest(appSecret: appSecret)
    }
    /// Multiple reports
    public init(
      appSecret: String,
      events: QBTrackReport...
    ) {
      if let encodedData = try? JSONEncoder().encode(QBReportEvents(events: events)) {
        self.body = encodedData
      }
      self.parameters = [URLQueryItem]()
      self.parameters = self.signRequest(appSecret: appSecret)
    }

    public typealias Response = QBStatus

    public let path: String = "track/reportStreamingEnd"

    public var parameters: [URLQueryItem]
    
    public var body: Data?
    
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
