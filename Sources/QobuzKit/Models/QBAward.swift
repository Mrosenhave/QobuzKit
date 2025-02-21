//
//  QBAward.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 31/01/2024.
//

import Foundation

//public struct QBAward: Codable {
//    public let id: Int?
//    public let name: String
//    public let awardedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case awardedAt = "awarded_at"
//    }
//}


public struct QBAward: Codable {
    public let name: String
    //    public let slug: String
    //    public let awardSlug: String
    public let awardedAt: Date?
    public let awardId: Int?
    //    public let publicationId: String?
    //    public let publicationName: String?
    //    public let publicationSlug: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug, awardSlug, awardedAt
        case awardId = "award_id"
        case publicationId = "publication_id"
        case publicationName = "publication_name"
        case publicationSlug = "publication_slug"
    }
    
}

extension QBAward {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        //        slug = try container.decode(String.self, forKey: .slug)
        //        awardSlug = try container.decode(String.self, forKey: .awardSlug)
        
        if let dateString = try? container.decodeIfPresent(String.self, forKey: .awardedAt),
           let date = DateFormatter.iso8601Full.date(from: dateString) {
            awardedAt = date
        } else {
            let timestamp = try container.decodeIfPresent(Double.self, forKey: .awardedAt)
            awardedAt = Date(timeIntervalSince1970: timestamp ?? 0)
        }
        if let id = try? container.decode(Int.self, forKey: .id){
            awardId = id
        } else if let id = try? container.decode(Int.self, forKey: .awardId){
            awardId = id
        } else {
            awardId = nil
        }
        
        
        //        publicationId = try? container.decode(String.self, forKey: .publicationId)
        //        publicationName = try? container.decode(String.self, forKey: .publicationName)
        //        publicationSlug = try? container.decode(String.self, forKey: .publicationSlug)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(awardedAt, forKey: .awardedAt)
        try container.encode(awardId, forKey: .awardId)
    }
}

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
}

