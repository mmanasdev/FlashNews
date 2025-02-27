//
//  NewsRowView.swift
//  FlashNews
//
//  Created by Miguel Mañas Alvarez on 25/2/25.
//

import SwiftUI

struct NewsRowView: View {
    let article: Article
    
    var body: some View {
        HStack(spacing: 12) {
            
            AsyncImage(url: URL(string: article.urlToImage ?? "" )) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 70, height: 70)
            .cornerRadius(8)
            .clipped()

            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)

                Text(article.source.name)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(article.publishedAt.formattedDate())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
//            Spacer()
        }
    }
}


struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView(article: .mock)
    }
}
