//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Praveen R on 01/07/23.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Binding var leftCurreny: Currency
    @Binding var rightCurreny: Currency
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Background parchment image
            Image("parchment")
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
                
            VStack {
                // Text
                Text("Select the curreny you are starting with:")
                    .fontWeight(.bold)
                
                // Currency icons
                IconGrid(currency: $leftCurreny)
                
                // Text
                Text("Select the curreny you would like to convert to:")
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                
                // Currency icons
                IconGrid(currency: $rightCurreny)
                
                // Done button
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Done")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(.brown)
                        .cornerRadius(15)
                }
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurreny: .constant(.silverPiece),
                       rightCurreny: .constant(.goldPiece))
    }
}
