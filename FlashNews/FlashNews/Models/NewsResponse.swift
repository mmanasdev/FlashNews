//
//  NewsResponse.swift
//  FlashNews
//
//  Created by Miguel Mañas Alvarez on 25/2/25.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author, title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}

// MARK: - Mocks
extension Article {
    static let mock = Article(
        source: Source(id: "nbc-news", name: "NBC News"),
        author: "Daniel Arkin",
        title: "Lester Holt is stepping down as anchor of 'NBC Nightly News' after a decade - NBC News",
        description: "Lester Holt, the anchor and managing editor of “NBC Nightly News” for a decade, announced Monday that he is stepping down from the long-running broadcast at the beginning of the summer.",
        url: "https://www.nbcnews.com/news/us-news/lester-holt-anchor-nbc-nightly-news-rcna193445",
        urlToImage: "https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/rockcms/2025-02/250224-lester-holt-studio-cs-f1ae07.jpg",
        publishedAt: Date(),
        content: "Lester Holt, the anchor and managing editor of NBC Nightly News for a decade, announced Monday that he is stepping down..."
    )
}
