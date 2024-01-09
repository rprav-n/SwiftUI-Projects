//
//  ContentView.swift
//  TextEditor
//
//  Created by Praveen R on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var userText = "Hello world"
    var body: some View {
        VStack {
            Text(userText)
                .font(.largeTitle)
                .foregroundColor(.red)
            TextField("Enter text here", text: $userText)
            
            HStack {
                CustomButtonView(title: "ALL CAPS", color: .red)
                CustomButtonView(title: "First Letter", color: .green)
                CustomButtonView(title: "lowercase", color: .blue)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
