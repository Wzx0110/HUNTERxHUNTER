//
//  CharacterView.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/10/23.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        NavigationStack {
            List {
                // 按照 type 幫角色分組
                ForEach(Dictionary(grouping: CharacterData.characters, by: { $0.type }).sorted(by: { $0.key < $1.key }), id: \.key) { type, characters in
                    //Section 顯示
                    Section(header: Text(type)) {
                        ForEach(characters) { character in
                            NavigationLink(value: character) {
                                CharacterRow(character: character)
                            }
                        }
                    }
                }
            }
            .navigationTitle("角色")
            .navigationDestination(for: Character.self) { character in
                CharacterDetailView(character: character)
            }
        }
    }
}


#Preview {
    CharacterView()
}
