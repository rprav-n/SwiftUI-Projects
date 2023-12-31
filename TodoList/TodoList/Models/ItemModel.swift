//
//  ItemModel.swift
//  TodoList
//
//  Created by Praveen R on 27/07/23.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: self.id, title: self.title, isCompleted: !self.isCompleted)
    }
}
