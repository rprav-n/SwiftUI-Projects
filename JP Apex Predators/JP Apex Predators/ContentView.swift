//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Praveen R on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    
    var apController = Controller()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(apController.apexPredators) { predator in
                    NavigationLink {
                        Text("Dino details go here")
                    } label: {
                        PredatorRow(predator: predator)
                    }

                }
            }
            .navigationTitle("Apex Predators")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
