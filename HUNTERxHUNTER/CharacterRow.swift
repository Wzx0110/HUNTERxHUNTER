//
//  CharacterRow.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/10/23.
//

import SwiftUI

struct CharacterRow: View {
    let character: Character
    var body: some View {
        HStack {
            Image(character.image)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(.circle)
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 2)
                }
                .shadow(color: .primary, radius: 5)
            Text(character.name)
                .font(.headline)
            Spacer()
        }
        .background(Color.accentColor, in: .rect(cornerRadius: 30))
    }
}
#Preview(traits: .sizeThatFitsLayout) {
    CharacterRow(character: CharacterData.characters[0])
    CharacterRow(character: CharacterData.characters[1])
}
