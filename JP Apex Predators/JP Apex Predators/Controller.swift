//
//  Controller.swift
//  JP Apex Predators
//
//  Created by Praveen R on 16/07/23.
//

import Foundation

class Controller {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func sortByAlphabetical() -> [ApexPredator] {
        apexPredators.sort { $0.name < $1.name }
        return apexPredators
    }
    
    func sortByMovieAppearance() -> [ApexPredator] {
        apexPredators.sort { $0.id < $1.id }
        return apexPredators
    }
}
