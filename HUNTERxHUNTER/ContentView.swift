//
//  ContentView.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var startApp = true // 控制開頭動畫

    var body: some View {
        ZStack {
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
            .accentColor(.accentColor)
        
            // 顯示開頭動畫，點擊畫面後消失
            if startApp {
                StartView()
                    .transition(.opacity)
                    .onTapGesture {
                        withAnimation {
                            startApp = false
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
