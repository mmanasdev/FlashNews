//
//  NewsListView.swift
//  FlashNews
//
//  Created by Miguel Mañas Alvarez on 25/2/25.
//

import SwiftUI

import SwiftUI

struct NewsListView: View {
    @ObservedObject var viewModel: NewsListViewModel

    var body: some View {
        NavigationView {
                VStack {
                    if viewModel.isLoading {
                        ProgressView("Cargando noticias...")
                    } else {
                        List(viewModel.articles, id: \.url) { article in
                            NewsRowView(article: article)
                        }
                        .listStyle(.insetGrouped)
                    }
                }
            .navigationTitle("FlashNews 📰")
            .onAppear {
                viewModel.fetchNews()
            }
            
        }
    }
}



struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewsListView(viewModel: NewsListViewModelMock())
        }
    }
}

// ✅ Mock de `NewsListViewModel` para pruebas y previews
class NewsListViewModelMock: NewsListViewModel {
    override init() {
        super.init()
        self.articles = [
            Article(
                source: Source(id: "cnn", name: "CNN"),
                author: "Jane Doe",
                title: "Breaking News: Major Event Unfolds",
                description: "A major event has unfolded, causing widespread impact across the region.",
                url: "https://www.cnn.com/2025/02/25/breaking-news-major-event",
                urlToImage: "https://via.placeholder.com/150",
                publishedAt: Date(),
                content: "Detailed content about the major event..."
            ),
            Article(
                source: Source(id: "bbc-news", name: "BBC News"),
                author: "John Smith",
                title: "Technology Advances in 2025",
                description: "Innovations in technology are shaping the future in unprecedented ways.",
                url: "https://www.bbc.com/news/technology-advances-2025",
                urlToImage: "https://via.placeholder.com/150",
                publishedAt: Date(),
                content: "In-depth analysis of technological innovations..."
            ),
            Article(
                source: Source(id: "the-verge", name: "The Verge"),
                author: "Alice Johnson",
                title: "New Smartphone Release Shocks Consumers",
                description: "The latest smartphone release has taken the market by storm.",
                url: "https://www.theverge.com/2025/02/25/new-smartphone-release",
                urlToImage: "https://via.placeholder.com/150",
                publishedAt: Date(),
                content: "Comprehensive review of the new smartphone..."
            )
        ]
        self.isLoading = false
    }
}
