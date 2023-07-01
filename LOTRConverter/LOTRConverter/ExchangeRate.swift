//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Praveen R on 01/07/23.
//

import SwiftUI

struct ExchangeRate: View {
    
    var leftImage: String
    var text: String
    var rightImage: String
    
    var body: some View {
        HStack {
            // Left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange rate text
            Text(text)
            
            // Right curreny image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpenny", text: "1 Gold Penny = 4 Silver Pennies", rightImage: "silverpiece")
            .previewLayout(.sizeThatFits)
    }
}
