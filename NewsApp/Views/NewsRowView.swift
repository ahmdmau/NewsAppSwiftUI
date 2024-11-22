//
//  NewsRowView.swift
//  NewsApp
//
//  Created by ICT Ahmad Maulana on 22/11/24.
//

import SwiftUI

struct NewsRowView: View {
    let article: NewsArticle

    var body: some View {
        HStack(alignment: .center) {
            
            AsyncImage(url: URL(string: article.thumbnail)) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(width: 100, height: 100)
            .cornerRadius(8)
            .clipped()

            
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(2)

                Text(article.content.prefix(100) + "...")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)

                Text(article.publishedAt)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 8)
    }
}
