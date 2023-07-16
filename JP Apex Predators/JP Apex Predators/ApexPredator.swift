//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by Praveen R on 16/07/23.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    // Computed Property
    var typeOverlay: Color {
            switch type {
            case "land": return Color.brown
            case "air": return Color.teal
            case "sea": return Color.blue
            default:
                return Color.white
            }
        }
    
//    func typeOverlay() -> Color {
//        switch type {
//        case "land": return Color.brown
//        case "air": return Color.teal
//        case "sea": return Color.blue
//        default:
//            return Color.white
//        }
//    }
}

struct MovieScene: Codable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
