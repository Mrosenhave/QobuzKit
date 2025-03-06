//
//  QBStoryHeadlines.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 27/02/2025.
//


public struct QBStoryHeadlines: Codable {
    public let basic: String
    public let metaTitle: String?
    public let mobile: String?
    public let native: String?
    public let print: String?
    public let tablet: String?
    public let web: String?

    public enum CodingKeys: String, CodingKey {
        case basic = "basic"
        case metaTitle = "meta_title"
        case mobile = "mobile"
        case native = "native"
        case print = "print"
        case tablet = "tablet"
        case web = "web"
    }

    public init(basic: String, metaTitle: String?, mobile: String?, native: String?, print: String?, tablet: String?, web: String?) {
        self.basic = basic
        self.metaTitle = metaTitle
        self.mobile = mobile
        self.native = native
        self.print = print
        self.tablet = tablet
        self.web = web
    }
}
