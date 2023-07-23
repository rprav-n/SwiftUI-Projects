//
//  FetchController.swift
//  BB Quotes
//
//  Created by Praveen R on 23/07/23.
//

import Foundation

class FetchController {
    enum NetworkError: Error {
        case badURL, badResponse
    }
    // https://breaking-bad-api-six.vercel.app/api/quotes/random?production=Breaking+Bad
    private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    func fetchQuote(from show: String) async throws  -> Quote {
        
        let quoteURL = baseURL.appending(path: "quotes/random")
        var quoteComponents = URLComponents(url: quoteURL, resolvingAgainstBaseURL: true)
        let quoteQueryItem = URLQueryItem(name: "production", value: show.replacingOccurrences(of: " ", with: "+"))
        quoteComponents?.queryItems = [quoteQueryItem]
        
        guard let fetchURL = quoteComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let quote = try decoder.decode(Quote.self, from: data)
        
        return quote
    }
}
