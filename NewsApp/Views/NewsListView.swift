//
//  NewsListView.swift
//  NewsApp
//
//  Created by ICT Ahmad Maulana on 22/11/24.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                // Main content
                List(viewModel.articles) { article in
                    NavigationLink(destination: NewsDetailView(article: article)) {
                        NewsRowView(article: article)
                    }
                }
                .navigationTitle("News")
                .onAppear {
                    viewModel.fetchNews()
                }
                
                // Loading indicator
                if viewModel.isLoading {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(2)
                }
                
                // Error message
                if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text(errorMessage)
                            .font(.title)
                            .foregroundColor(.red)
                            .padding()
                        Button("Retry") {
                            viewModel.fetchNews()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
            }
        }
    }
}
