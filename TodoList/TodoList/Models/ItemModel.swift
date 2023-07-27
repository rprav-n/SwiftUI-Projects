//
//  ItemModel.swift
//  TodoList
//
//  Created by Praveen R on 27/07/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
