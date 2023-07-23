//
//  ContentView.swift
//  BB Quotes
//
//  Created by Praveen R on 23/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Breaking Bad View")
                .tabItem {
                    Label {
                        Text("Breaking Bad")
                    } icon: {
                        Image(systemName: "tortoise")
                    }
                }
         
            Text("Better Call Saul View")
                .tabItem {
                    Label {
                        Text("Better Call Saul")
                    } icon: {
                        Image(systemName: "briefcase")
                            
                    }
                }
        }
        .onAppear {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
