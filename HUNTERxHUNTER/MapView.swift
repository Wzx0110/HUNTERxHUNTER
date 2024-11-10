//
//  MapView.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/11/8.
//

import SwiftUI
import AVKit

struct MapView: View {
    // 儲存每個區域的展開狀態
    @State private var expandedStates = [false, false, false]
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(0..<3, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        // 使用 DisclosureGroup 顯示每個區域的詳細資訊
                        DisclosureGroup(
                            isExpanded: $expandedStates[index],
                            content: {
                                Text(MapData.maps[index].description)
                                    .font(.body)
                                    .padding(.vertical, 10)
                            },
                            label: {
                                Text(MapData.maps[index].text)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.accentColor)
                            }
                        )
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.gray, lineWidth: 1)
                        )
                    }
                }
                // 網路圖片顯示
                AsyncImage(url: URL(string: "https://i1.kknews.cc/Wz_xEbCx3RJ-Qaq_ZrlDW3e8dAXo2_hdKw/0.jpg")) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFill()
                .cornerRadius(15)
                .shadow(radius: 5)
                // 片頭曲
                Text("片頭曲")
                    .font(.title)
                    .fontWeight(.bold)
                // 影片播放器
                let url = Bundle.main.url(forResource: "hunter", withExtension: "mp4")!
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(width: 380, height: 280)
            }
            .padding()
            .navigationTitle("世界觀")
        }
    }
}

#Preview {
    MapView()
}
