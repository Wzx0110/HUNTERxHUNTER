//
//  CharacterDetailView.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/10/23.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 角色照片與名字
                HStack(spacing: 20) {
                    Image(character.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        .shadow(radius: 10)
                    Text(character.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.vertical, 10)
                // 基本資料
                VStack(alignment: .leading, spacing: 15) {
                    Text("基本資料")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    Rectangle()
                        .foregroundStyle(Color.accentColor)
                        .frame(width: 90, height: 5)
                        .offset(y: -20)
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("性別 : \(character.gender)")
                            Text("身高 : \(character.height)")
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("年齡 : \(character.age)")
                            Text("念能力 : \(character.ability)")
                        }
                    }
                    .padding(.horizontal)
                }
                .offset(x: -80)
                
                Divider()
                    .padding(.vertical, 10)
                // 角色介紹
                VStack(alignment: .leading, spacing: 15) {
                    Text("角色介紹")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    Rectangle()
                        .foregroundStyle(Color.accentColor)
                        .frame(width: 90, height: 5)
                        .offset(y: -20)
                    
                    Text(character.description)
                        .font(.body)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                }
            }
            .padding(.top)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CharacterDetailView(character: CharacterData.characters[0])
}
