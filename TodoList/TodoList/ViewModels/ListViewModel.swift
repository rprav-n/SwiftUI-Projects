//
//  ListViewModel.swift
//  TodoList
//
//  Created by Praveen R on 06/08/23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "Title", isCompleted: false),
            ItemModel(title: "Hello world", isCompleted: true)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int ) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func toggleItemStatus(item: ItemModel) {
//        if let index = items.firstIndex { existingItem in
//            existingItem.id == item.id
//        } {
//
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id})
        {
            items[index] = item.updateCompletion()
        }
    }
}
