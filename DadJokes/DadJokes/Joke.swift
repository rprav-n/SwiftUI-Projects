//
//  Joke.swift
//  DadJokes
//
//  Created by Praveen R on 13/08/23.
//

import Foundation

struct Joke: Codable {
    let status: Int
    let response: String
    let joke: String
    let type: String
}
