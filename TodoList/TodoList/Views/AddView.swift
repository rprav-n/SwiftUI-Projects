//
//  AddView.swift
//  TodoList
//
//  Created by Praveen R on 26/07/23.
//

import SwiftUI

struct AddView: View {
    
    @State var text: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something here", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding()
        }
        .navigationTitle("Add an Item 🖊")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
