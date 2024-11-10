//
//  ContentView.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("介紹", systemImage: "book") {
                MainView()
            }
            Tab("角色", systemImage: "person.3") {
                CharacterView()
            }
            Tab("世界觀", systemImage: "map") {
                MapView()
            }
            Tab("念能力", systemImage: "bonjour") {
                AbilityView()
            }
            .defaultVisibility(.hidden, for: .tabBar)
        }
        .tabViewStyle(.sidebarAdaptable)
        .accentColor(.accentColor) //light黃色dark綠色
    }
}


#Preview {
    ContentView()
}
