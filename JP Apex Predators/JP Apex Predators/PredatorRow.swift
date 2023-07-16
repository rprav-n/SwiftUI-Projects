//
//  PredatorRow.swift
//  JP Apex Predators
//
//  Created by Praveen R on 16/07/23.
//

import SwiftUI

struct PredatorRow: View {
    
    let predator: ApexPredator
    
    var body: some View {
        HStack {
            // Dinosaur image
            Image(predator.name.lowercased().replacingOccurrences(of: " ", with: ""))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .white, radius: 1, x: 0, y: 0)
            
            VStack(alignment: .leading) {
                // Name
                Text(predator.name)
                    .fontWeight(.bold)
                
                // Type
                Text(predator.type.capitalized)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .fill( predator.typeOverlay.opacity(0.33))
                    }
            }
        }
    }
}

struct PredatorRow_Previews: PreviewProvider {
    static var previews: some View {
        let movieScene = MovieScene(id: 2, movie: "Jurassic Park III", sceneDescription: "Passengers of the plane N622DC saw a herd of Brachiosaurus during their fly-over of Isla Sorna at the beginning of the Isla Sorna Incident of 2001.\n\nAnother herd was seen by Dr. Alan Grant and the Kirby family at a river bank.")
        let predator = ApexPredator(id: 1, name: "Brachiosaurus", type: "land", movies: [
            "Jurassic Park",
            "Jurassic Park III",
            "Jurassic World: Fallen Kingdom"
        ], movieScenes: [movieScene], link: "https://jurassicpark.fandom.com/wiki/Brachiosaurus")
        
        PredatorRow(predator: predator)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
