//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Praveen R on 01/07/23.
//

import SwiftUI

struct IconGrid: View {
    
    @Binding var currency: Currency
    let gridLayout = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(0..<5) { i in
                if Currency.allCases[i] == currency {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                        .shadow(color: .black, radius: 9)
                } else {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[i]
                        }
                }
                
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(currency: .constant(Currency.silverPiece))
            .previewLayout(.sizeThatFits)
    }
}
