//
//  QBStoryArticle.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 27/02/2025.
//

public struct QBStoryArticle: Decodable {
    public let id: String
    public let contentElements: [QBStoryArticleElement]
//    public let credits: QBStoryArticleCredits
    public let displayDate: String
    public let headlines: QBStoryHeadlines
//    public let language: Language
//    public let promoItems: PromoItems
    public let subheadlines: QBStoryHeadlines

    public enum CodingKeys: String, CodingKey {
        case id = "_id"
        case contentElements = "content_elements"
//        case credits
        case displayDate = "display_date"
        case headlines
//        case language
//        case promoItems = "promo_items"
        case subheadlines
    }

    public init(id: String, contentElements: [QBStoryArticleElement], /*credits: QBStoryArticleCredits,*/ displayDate: String, headlines: QBStoryHeadlines, /*language: Language, promoItems: PromoItems,*/ subheadlines: QBStoryHeadlines) {
        self.id = id
        self.contentElements = contentElements
//        self.credits = credits
        self.displayDate = displayDate
        self.headlines = headlines
//        self.language = language
//        self.promoItems = promoItems
        self.subheadlines = subheadlines
    }
}
