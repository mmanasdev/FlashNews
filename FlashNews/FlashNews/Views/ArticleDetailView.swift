//
//  ArticleDetailView.swift
//  FlashNews
//
//  Created by Miguel Mañas Alvarez on 26/2/25.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 200)
                        case .success(let image):
                            image.resizable()
                                .scaledToFit()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }

                Text(article.title)
                    .font(.title)
                    .bold()

                Text("By \(article.author ?? "Unknown")")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                if let description = article.description {
                    Text(description)
                        .font(.body)
                }
                if let url = URL(string: article.url) {
                    Link("Read More", destination: url)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top, 8)
                }
            }
            .padding()
        }
        .navigationTitle("Article Detail")
    }
}
