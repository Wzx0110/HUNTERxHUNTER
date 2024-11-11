//
//  StartView.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/11/11.
//
import SwiftUI

struct StartView: View {
    @State private var isVisible: Bool = true
    
    var body: some View {
        ZStack {
            // 背景
            Color.accentColor
                .edgesIgnoringSafeArea(.all)
            Image(.奇犽左)
                .scaleEffect(1.6)
                .offset(x:220)
            Image(.小傑右)
                .scaleEffect(1.6)
                .offset(x:500)
            Image(.logo)
            VStack {
                // 3D 卡牌
                CardView()
                    .offset(y: 390)
                    .scaleEffect(0.4)
                Text("點擊畫面開始")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .offset(y: 50)
                    .opacity(isVisible ? 1 : 0)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                            isVisible.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    StartView()
}
