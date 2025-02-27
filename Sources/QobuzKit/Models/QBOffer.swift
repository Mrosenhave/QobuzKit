//
//  QBOffer.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 25/02/2025.
//

// MARK: - QBOffer
public struct QBOffer: Codable {
    public let appstoreProductIdentifier, periodicity: String
    public let freeMonth: Int
    public let meta: Meta
    public let title, description: String
    public let hires: Bool
    public let followAnalytics: String

    public enum CodingKeys: String, CodingKey {
        case appstoreProductIdentifier = "appstore_product_identifier"
        case periodicity
        case freeMonth = "free_month"
        case meta, title, description, hires
        case followAnalytics = "follow_analytics"
    }

    public init(appstoreProductIdentifier: String, periodicity: String, freeMonth: Int, meta: Meta, title: String, description: String, hires: Bool, followAnalytics: String) {
        self.appstoreProductIdentifier = appstoreProductIdentifier
        self.periodicity = periodicity
        self.freeMonth = freeMonth
        self.meta = meta
        self.title = title
        self.description = description
        self.hires = hires
        self.followAnalytics = followAnalytics
    }
}

// MARK: - Meta
public struct Meta: Codable {
    public let en: En

    public init(en: En) {
        self.en = en
    }
}

// MARK: - En
public struct En: Codable {
    public let title, description: String

    public init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}

public struct QBOffers: Codable {
    public let status: String
    public let offers: [QBOffer]?
}
