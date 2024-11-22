//
//  NewsArticle.swift
//  NewsApp
//
//  Created by ICT Ahmad Maulana on 22/11/24.
//

import Foundation

struct NewsArticle: Identifiable, Decodable {
    let id: Int
    let slug: String
    let url: String
    let title: String
    let content: String
    let image: String
    let thumbnail: String
    let status: String
    let category: String
    let publishedAt: String
    let updatedAt: String
    let userId: Int

    private enum CodingKeys: String, CodingKey {
        case id, slug, url, title, content, image, thumbnail, status, category, publishedAt, updatedAt, userId
    }
}
