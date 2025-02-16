//
//  QBUser.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBUser: Codable {
    let id: Int
    let publicID: String
    let email: String
    let login: String
    let firstname: String?
    let lastname: String?
    let displayName: String?
    let countryCode: String
    let languageCode: String
    let zone: String
    let store: String
    let country: String
    let avatar: String
    let genre: String?
    let age: Int
    let creationDate: String
    let subscription: QBSubscription?
    let credential: QBCredential
    let lastUpdate: QBLastUpdate
    let storeFeatures: QBStoreFeatures
    
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
    
//    init(id: Int, publicID: String, email: String, login: String, firstname: String?, lastname: String?, displayName: String, countryCode: String, languageCode: String, zone: String, store: String, country: String, avatar: String, genre: String?, age: Int, creationDate: String, subscription: QBSubscription, credential: QBCredential, lastUpdate: QBLastUpdate, storeFeatures: QBStoreFeatures) {
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
struct QBCredential: Codable {
    let id: Int?
    let label: String?
    let credentialDescription: String
    let parameters: QBParameters?
    
    enum CodingKeys: String, CodingKey {
        case id
        case label
        case credentialDescription = "description"
        case parameters
    }
}


// MARK: - Parameters
struct QBParameters: Codable {
    
    let lossyStreaming: Bool
    let losslessStreaming: Bool
    let hiresStreaming: Bool
    let hiresPurchasesStreaming: Bool
    let mobileStreaming: Bool
    let offlineStreaming: Bool
    let hfpPurchase: Bool
    let includedFormatGroupIDS: [Int]
    let label: String
    let shortLabel: String
    let source: String
    
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
struct QBLastUpdate: Codable {
    let favorite: Int
    let favoriteAlbum: Int
    let favoriteArtist: Int
    let favoriteTrack: Int
    let playlist: Int
    let purchase: Int
    
    enum CodingKeys: String, CodingKey {
        case favorite
        case favoriteAlbum = "favorite_album"
        case favoriteArtist = "favorite_artist"
        case favoriteTrack = "favorite_track"
        case playlist, purchase
    }
}

// MARK: - StoreFeatures
struct QBStoreFeatures: Codable {
    let download: Bool
    let streaming: Bool
    let editorial: Bool
    let club: Bool
    let wallet: Bool
    let weeklyq: Bool
    let autoplay: Bool
    let inappPurchaseSubscripton: Bool
    let optIn: Bool
    let musicImport: Bool
    
    enum CodingKeys: String, CodingKey {
        case download, streaming, editorial, club, wallet, weeklyq, autoplay
        case inappPurchaseSubscripton = "inapp_purchase_subscripton"
        case optIn = "opt_in"
        case musicImport = "music_import"
    }
}

// MARK: - Subscription
struct QBSubscription: Codable {
    let offer: String
    let periodicity: String
    let startDate: String
    let endDate: String
    let isCanceled: Bool
    let householdSizeMax: Int
    
    enum CodingKeys: String, CodingKey {
        case offer, periodicity
        case startDate = "start_date"
        case endDate = "end_date"
        case isCanceled = "is_canceled"
        case householdSizeMax = "household_size_max"
    }
}
