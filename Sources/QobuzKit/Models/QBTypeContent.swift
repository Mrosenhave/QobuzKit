//
//  QBTypeContent.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/07/2024.
//

import Foundation

public struct QBTypeContent: Codable, Hashable {
  public init(type: QBTypeContentType, content: any QBContent) {
    self.type = type
    self.content = content
  }
  
    public let type: QBTypeContentType
    public let content: QBContent
    enum CodingKeys: String, CodingKey {
        case type
        case content
    }
}
extension QBTypeContent {
  public static func == (lhs: QBTypeContent, rhs: QBTypeContent) -> Bool {
        let hasSameType = lhs.type == rhs.type
        var hasSameId: Bool = false
        if hasSameType {
            switch lhs.type {
            case .artists:
                let lhsContent = lhs.content as! QBArtist
                let rhsContent = rhs.content as! QBArtist
                hasSameId = lhsContent.id == rhsContent.id
            case .albums:
                let lhsContent = lhs.content as! QBAlbum
                let rhsContent = rhs.content as! QBAlbum
                hasSameId = lhsContent.id == rhsContent.id
            case .tracks:
                let lhsContent = lhs.content as! QBTrack
                let rhsContent = rhs.content as! QBTrack
                hasSameId = lhsContent.id == rhsContent.id
            case .playlists:
                let lhsContent = lhs.content as! QBPlaylist
                let rhsContent = rhs.content as! QBPlaylist
                hasSameId = lhsContent.id == rhsContent.id
            }
            return hasSameId
        } else {
            return false
        }
        
    }
    
  public func hash(into hasher: inout Hasher) {
//        hasher.combine(content)
        switch type {
        case .artists:
            let tempContent = content as! QBArtist
            hasher.combine(tempContent.id)
        case .albums:
            let tempContent = content as! QBAlbum
            hasher.combine(tempContent.id)
        case .tracks:
            let tempContent = content as! QBTrack
            hasher.combine(tempContent.id)
        case .playlists:
            let tempContent = content as! QBPlaylist
            hasher.combine(tempContent.id)
        }
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(QBTypeContentType.self, forKey: .type)
        
        let content:QBContent = switch type {
        case .artists:
            try container.decode(QBArtist.self, forKey: .content)
        case .albums:
                try container.decode(QBAlbum.self, forKey: .content)
        case .tracks:
            try container.decode(QBTrack.self, forKey: .content)
        case .playlists:
            try container.decode(QBPlaylist.self, forKey: .content)
        }
        self.content = content
    }
    
  public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(content, forKey: .content)
    }
}

public enum QBTypeContentType: String, Codable{
    case artists
    case albums
    case tracks
    case playlists
}

public protocol QBContent: Codable {}
