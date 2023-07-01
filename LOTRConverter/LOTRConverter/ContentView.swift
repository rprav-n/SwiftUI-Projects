//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Praveen R on 01/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack {
                // Prancy pony image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                // Currency conversion section
                HStack {
                    // Left conversion section
                    VStack {
                        // Curreny
                        HStack {
                            // Curreny image
                            Image("silverpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Curreny text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        // Text field
                        Text("Text field")
                    }
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    // Right conversion section
                    VStack {
                        // Curreny
                        HStack {
                            // Curreny text
                            Text("Gold Penny")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            // Curreny image
                            Image("goldpenny")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        
                        // Text field
                        Text("Text field")
                    }
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    // Info Button
                    Button {
                        
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
