//
//  AbilityView.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/10/24.
//

import SwiftUI

struct AbilityView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    // 六大念能力
                    Text("六大念能力")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                    
                    Image("念")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding(.bottom, 20)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    
                    ZStack {
                        Text("""
        《獵人》裡將人體溢出的生命能量稱為「氣」，有意識地使用「氣」進行攻擊或防禦的能力則稱為「念」。在獵人考試通過後，還要接受「念」的訓練，才能成為真正的獵人。一般來說「念」的訓練方法是不公開的，但也有極少數人意外地通過其他修煉方式，如燃等練成念能力。
        
        掌握念能力的方法只有兩種：長期進行修行從而悟出念，或承受他人的發，打通身上的精孔，強令自己學會。後者較粗暴，接受者必須有良好的體質。
        """)
                        .font(.body)
                        .lineSpacing(8)
                        .padding(.horizontal, 20)
                    }.offset(y: -30)
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    // 念的基本
                    Text("念的基本")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("· **纏**：使全身到處流竄的氣穩定，在作戰時，纏的強度等於對念攻擊的防禦力。")
                        
                        Text("· **絕**：收緊並隔絕全身的氣和氣息，使自己的存在感變得微弱。在絕的狀態下，對念攻擊的防禦力趨近於零。在疲勞的狀態下進入絕的狀態有助於恢復體力。")
                        
                        Text("· **練**：將體內煉出的氣從精孔一齊向外發出，釋放出比平時更多的氣。")
                        
                        Text("· **發**：這是念能力之集大成者，對自己的氣進行自由的操縱和運用。必殺技式的能力，每個人的能力因人而異。")
                    }
                    .font(.body)
                    .padding(.horizontal, 20)
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    // 水見式
                    Text("水見式")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    // TabView水見式
                    TabView {
                        ForEach(AbilityData.abilities) { ability in
                            VStack {
                                // 照片
                                Image(ability.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 250, height: 250)
                                    .padding(.bottom, 10)
                                // 簡介
                                Text(ability.text)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 5)
                                // 詳細
                                Text(ability.description)
                                    .font(.body)
                                    .lineSpacing(6)
                                    .padding(.horizontal, 20)
                            }
                        }
                    }
                    .frame(height: 600)
                    .offset(y: -150)
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    
                    Divider()
                        .padding(.vertical, 20)
                        .offset(y: -150)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                // 小遊戲畫面
                GameView()
                    .padding(.top, -30)
                    .offset(y: -150)
            }
            .padding(.top, 10)
            .navigationTitle("念能力")
        }
    }
}

#Preview {
    AbilityView()
}

