//
//  MainView.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/11/8.
//

import SwiftUI

struct MainView: View {
    let energy = [
        "念能力", "怨能力"
    ]
    let organize = [
        "獵人協會", "十二支", "卡金黑幫", "嵌合蟻討伐隊", "新源流", "揍敵客家族", "幻影旅團", "黑手黨", "Southern Peace", "NGL", "嵌合蟻", "V5", "卡金帝國"
    ]
    let region = [
        "G·I島", "城堡下的城市-里美路", "海邊城市-壽富拉比", "魔法都市-瑪沙多拉", "懸賞城市-安多奇拔", "賭博城市-杜力亞司", "戀愛都市-愛愛", "六大陸", "天空競技場", "流星街", "友克鑫市"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // 力量體系
                VStack {
                    Text("力量體系")
                        .font(.title2)
                        .fontWeight(.bold)
                    Rectangle()
                        .foregroundStyle(Color.accentColor)
                        .frame(width: 100, height: 5)
                        .offset(y: -10)
                }
                let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(energy.indices, id: \.self) { item in
                        PhotoView(name: energy[item])
                    }
                }
                .padding()
                // 組織團體
                VStack {
                    Text("組織團體")
                        .font(.title2)
                        .fontWeight(.bold)
                    Rectangle()
                        .foregroundStyle(Color.accentColor)
                        .frame(width: 100, height: 5)
                        .offset(y: -10)
                }
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(organize.indices, id: \.self) { item in
                        PhotoView(name: organize[item])
                    }
                }
                .padding()
                // 地域人文
                VStack {
                    Text("地域人文")
                        .font(.title2)
                        .fontWeight(.bold)
                    Rectangle()
                        .foregroundStyle(Color.accentColor)
                        .frame(width: 100, height: 5)
                        .offset(y: -10)
                }
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(region.indices, id: \.self) { item in
                        PhotoView(name: region[item])
                    }
                }
                .padding()
                //wiki連結
                Link("More...", destination: URL(string: "https://zh.wikipedia.org/zh-tw/HUNTER×HUNTER")!)
                    .font(.title2)
                    .padding()
            }.navigationTitle("介紹")
        }
    }
}

#Preview {
    MainView()
}
