//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Praveen R on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    
    var apController = Controller()
    @State var sortAlphabetical = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortAlphabetical ? apController.sortByAlphabetical() : apController.sortByMovieAppearance()) { predator in
                    NavigationLink {
                        PredatorDetail(predator: predator)
                    } label: {
                        PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        sortAlphabetical.toggle()
                    } label: {
                        if sortAlphabetical {
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
