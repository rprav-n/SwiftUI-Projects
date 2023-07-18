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
    @State var currentFilter = "All"
    
    var body: some View {
        
        apController.filterBy(type: currentFilter)
        
        if sortAlphabetical {
            apController.sortByAlphabetical()
        } else {
            apController.sortByMovieAppearance()
        }
        
        return NavigationView {
            List {
                ForEach(apController.apexPredators) { predator in
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
                        withAnimation {
                            sortAlphabetical.toggle()
                        }
                        
                    } label: {
                        if sortAlphabetical {
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilter.animation()) {
                            ForEach(apController.typeFilters, id: \.self) { filter in
                                Label(filter, systemImage: apController.typeIcon(for: filter))
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
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
