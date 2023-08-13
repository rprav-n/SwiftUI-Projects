//
//  JokeType.swift
//  DadJokes
//
//  Created by Praveen R on 13/08/23.
//

import Foundation

enum JokeType: String, Codable, CaseIterable {
    case chucknorris = "Chuck Norris",
    dadjoke = "Dad Joke",
    random = "Random",
    yomama = "Yo Mama"
    
    var type: String {
        switch self {
            
        case .chucknorris:
            return "chucknorris"
        case .dadjoke:
            return "dadjoke"
        case .random:
            return "random"
        case .yomama:
            return "yomama"
        }
    }
    
}
