//
//  NewsListViewModel.swift
//  FlashNews
//
//  Created by Miguel Mañas Alvarez on 25/2/25.
//

import SwiftUI

class NewsListViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false

    init() {
    }

    func fetchNews() {
        Task {
            DispatchQueue.main.async {
                self.isLoading = true
            }

            let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=85f10fea23b44e44b99cd529a6769e00"
            
            guard let url = URL(string: urlString) else {
                print("❌ URL inválida")
                DispatchQueue.main.async { self.isLoading = false }
                return
            }

            do {
                let (data, response) = try await URLSession.shared.data(from: url)

                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("❌ Respuesta no válida del servidor")
                    DispatchQueue.main.async { self.isLoading = false }
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase // Opcional si el JSON usa snake_case
                decoder.dateDecodingStrategy = .iso8601 // Intento de parsear fechas en ISO8601
                
                let decodedResponse = try decoder.decode(NewsResponse.self, from: data)
                print("✅ JSON decodificado correctamente")
                DispatchQueue.main.async {
                    self.articles = decodedResponse.articles
                    self.isLoading = false
                }
            } catch let DecodingError.dataCorrupted(context) {
                print("❌ Data corrupta: \(context)")
            } catch let DecodingError.keyNotFound(key, context) {
                print("❌ Clave no encontrada: \(key), Contexto: \(context.debugDescription)")
            } catch let DecodingError.typeMismatch(type, context) {
                print("❌ Tipo incorrecto: \(type), Contexto: \(context.debugDescription)")
                } catch let DecodingError.valueNotFound(value, context) {
                    print("❌ Valor no encontrado: \(value), Contexto: \(context.debugDescription)")
                } catch {
                    print("❌ Error desconocido: \(error.localizedDescription)")
                }

        }
    }
}
