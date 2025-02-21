//
//  QBUser.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBUser: Codable {
    public let id: Int
    public let publicID: String
    public let email: String
    public let login: String
    public let firstname: String?
    public let lastname: String?
    public let displayName: String?
    public let countryCode: String
    public let languageCode: String
    public let zone: String
    public let store: String
    public let country: String
    public let avatar: String
    public let genre: String?
    public let age: Int
    public let creationDate: String
    public let subscription: QBSubscription?
    public let credential: QBCredential
    public let lastUpdate: QBLastUpdate
    public let storeFeatures: QBStoreFeatures
    
    enum CodingKeys: String, CodingKey {
        case id
        case publicID = "publicId"
        case email, login, firstname, lastname
        case displayName = "display_name"
        case countryCode = "country_code"
        case languageCode = "language_code"
        case zone, store, country, avatar, genre, age
        case creationDate = "creation_date"
        case subscription, credential
        case lastUpdate = "last_update"
        case storeFeatures = "store_features"
    }
    
//    public init(id: Int, publicID: String, email: String, login: String, firstname: String?, lastname: String?, displayName: String, countryCode: String, languageCode: String, zone: String, store: String, country: String, avatar: String, genre: String?, age: Int, creationDate: String, subscription: QBSubscription, credential: QBCredential, lastUpdate: QBLastUpdate, storeFeatures: QBStoreFeatures) {
//        self.id = id
//        self.publicID = publicID
//        self.email = email
//        self.login = login
//        self.firstname = firstname
//        self.lastname = lastname
//        self.displayName = displayName
//        self.countryCode = countryCode
//        self.languageCode = languageCode
//        self.zone = zone
//        self.store = store
//        self.country = country
//        self.avatar = avatar
//        self.genre = genre
//        self.age = age
//        self.creationDate = creationDate
//        self.subscription = subscription
//        self.credential = credential
//        self.lastUpdate = lastUpdate
//        self.storeFeatures = storeFeatures
//    }
}

// MARK: - Credential
public struct QBCredential: Codable {
    public let id: Int?
    public let label: String?
    public let credentialDescription: String
    public let parameters: QBParameters?
    
    enum CodingKeys: String, CodingKey {
        case id
        case label
        case credentialDescription = "description"
        case parameters
    }
}


// MARK: - Parameters
public struct QBParameters: Codable {
    
    public let lossyStreaming: Bool
    public let losslessStreaming: Bool
    public let hiresStreaming: Bool
    public let hiresPurchasesStreaming: Bool
    public let mobileStreaming: Bool
    public let offlineStreaming: Bool
    public let hfpPurchase: Bool
    public let includedFormatGroupIDS: [Int]
    public let label: String
    public let shortLabel: String
    public let source: String
    
    enum CodingKeys: String, CodingKey {
        case lossyStreaming = "lossy_streaming"
        case losslessStreaming = "lossless_streaming"
        case hiresStreaming = "hires_streaming"
        case hiresPurchasesStreaming = "hires_purchases_streaming"
        case mobileStreaming = "mobile_streaming"
        case offlineStreaming = "offline_streaming"
        case hfpPurchase = "hfp_purchase"
        case includedFormatGroupIDS = "included_format_group_ids"
        case label
        case shortLabel = "short_label"
        case source
    }
}

// MARK: - LastUpdate
public struct QBLastUpdate: Codable {
    public let favorite: Int
    public let favoriteAlbum: Int
    public let favoriteArtist: Int
    public let favoriteTrack: Int
    public let playlist: Int
    public let purchase: Int
    
    enum CodingKeys: String, CodingKey {
        case favorite
        case favoriteAlbum = "favorite_album"
        case favoriteArtist = "favorite_artist"
        case favoriteTrack = "favorite_track"
        case playlist, purchase
    }
}

// MARK: - StoreFeatures
public struct QBStoreFeatures: Codable {
    public let download: Bool
    public let streaming: Bool
    public let editorial: Bool
    public let club: Bool
    public let wallet: Bool
    public let weeklyq: Bool
    public let autoplay: Bool
    public let inappPurchaseSubscripton: Bool
    public let optIn: Bool
    public let musicImport: Bool
    
    enum CodingKeys: String, CodingKey {
        case download, streaming, editorial, club, wallet, weeklyq, autoplay
        case inappPurchaseSubscripton = "inapp_purchase_subscripton"
        case optIn = "opt_in"
        case musicImport = "music_import"
    }
}

// MARK: - Subscription
public struct QBSubscription: Codable {
    public let offer: String
    public let periodicity: String
    public let startDate: String
    public let endDate: String
    public let isCanceled: Bool
    public let householdSizeMax: Int
    
    enum CodingKeys: String, CodingKey {
        case offer, periodicity
        case startDate = "start_date"
        case endDate = "end_date"
        case isCanceled = "is_canceled"
        case householdSizeMax = "household_size_max"
    }
}
