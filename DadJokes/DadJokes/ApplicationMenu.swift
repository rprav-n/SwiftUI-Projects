//
//  ApplicationMenu.swift
//  DadJokes
//
//  Created by Praveen R on 13/08/23.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        let jokeView = JokeView()
        let topView = NSHostingController(rootView: jokeView) // Top of our application of the menu bar
        topView.view.frame.size = CGSize(width: 225, height: 225)
        
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())
        
        return menu
    }
}
