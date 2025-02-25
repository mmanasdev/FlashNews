//
//  NewsCoordinator.swift
//  FlashNews
//
//  Created by Miguel Mañas Alvarez on 25/2/25.
//

import SwiftUI

class NewsCoordinator: ObservableObject {
    @Published var selectedArticle: Article?
    let newsListViewModel: NewsListViewModel

    init() {
        self.newsListViewModel = NewsListViewModel()
    }

    func start() -> some View {
        NewsListView(viewModel: newsListViewModel)
    }

    func showNewsDetail(article: Article) {
        selectedArticle = article
    }
}
