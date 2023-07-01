//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Praveen R on 01/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurreny: Currency = .silverPiece
    @State var rightCurreny: Currency = .goldPiece
    
    @State var showSelectCurrencyScreen = false
    @State var showInfoScreen = false
    
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    
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
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurreny)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Curreny text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurreny)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            showSelectCurrencyScreen.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrencyScreen) {
                            SelectCurrency(leftCurreny: $leftCurreny, rightCurreny: $rightCurreny)
                        }

                        
                        // Text field
                        TextField("Amount", text: $leftAmount, onEditingChanged: { isTyping in
                            leftTyping = isTyping
                            //leftAmountTemp = leftAmount
                        })
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(8)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftAmount, perform: { _ in
                                if !leftTyping {
                                    return
                                }
                                rightAmount = leftCurreny.convert(amountString: leftAmount, to: rightCurreny)
                            })
                            .onChange(of: leftCurreny) { _ in
                                leftAmount = rightCurreny.convert(amountString: rightAmount, to: leftCurreny)
                            }
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
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurreny)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            // Curreny image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurreny)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrencyScreen.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrencyScreen) {
                            SelectCurrency(leftCurreny: $leftCurreny, rightCurreny: $rightCurreny)
                        }
                        
                        
                        // Text field
                        TextField("Amount", text: $rightAmount, onEditingChanged: { isTyping in
                            rightTyping = isTyping
                        })
                            .multilineTextAlignment(.trailing)
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(8)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightAmount, perform: { _ in
                                if !rightTyping {
                                    return
                                }
                                leftAmount = rightCurreny.convert(amountString: rightAmount, to: leftCurreny)
                            })
                            .onChange(of: rightCurreny) { _ in
                                rightAmount = leftCurreny.convert(amountString: leftAmount, to: rightCurreny)
                            }
                    }
                }
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(12)
                .padding(4)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    // Info Button
                    Button {
                        showInfoScreen.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $showInfoScreen) {
                        ExchangeInfo()
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
