//
//  TodoListApp.swift
//  TodoList
//
//  Created by Praveen R on 26/07/23.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - Data point
 View - UI
 ViewModel - Manages Models for View
 
 
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
