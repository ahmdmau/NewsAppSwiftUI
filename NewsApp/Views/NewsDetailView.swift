//
//  NewsDetailView.swift
//  NewsApp
//
//  Created by ICT Ahmad Maulana on 22/11/24.
//

import SwiftUI

struct NewsDetailView: View {
    let article: NewsArticle

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let url = URL(string: article.image) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                }

                Text(article.title)
                    .font(.title)
                    .bold()

                Text("Published on: \(article.publishedAt)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(article.content)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

