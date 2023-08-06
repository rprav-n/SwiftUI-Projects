//
//  AddView.swift
//  TodoList
//
//  Created by Praveen R on 26/07/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var text: String = ""
    
    var alertTitle = "Text should be atleast 3 characters long!! 😨"
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something here", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                //.disabled(text.count < 3)

            }
            .padding()
        }
        .navigationTitle("Add an Item 🖊")
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle))
        }
    }
    
    func saveButtonPressed() {
        if (text.count > 3) {
            listViewModel.addItem(title: text)
            presentationMode.wrappedValue.dismiss()
        } else {
            showAlert.toggle()
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
