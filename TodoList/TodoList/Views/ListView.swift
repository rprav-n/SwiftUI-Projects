//
//  ListView.swift
//  TodoList
//
//  Created by Praveen R on 26/07/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = ["This is the first todo", "Hello world"]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
            
        }
        .navigationTitle("Todo List 📝")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


