//
//  GameView.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/11/1.
//

import SwiftUI

struct GameView: View {
    @State private var currentImage: Image? = nil
    @State private var opacity: Double = 1.0
    @State private var ability: String = ""
    @State private var leafOffset: CGFloat = 0.0 // 葉子移動
    @State private var isShining = false // 閃光
    @State private var waterFlowOpacity: Double = 0.0 // 水流
    @State private var impurityOpacity: Double = 0.0 // 雜質
    @State private var sugarOpacity: Double = 0.0 // 糖
    @State private var isVisible = true // 文字閃爍
    @State private var isTapped = false // 是否第一次點擊
    @State private var hasChosenAbility = false // 是否已經選擇能力
    
    var body: some View {
        VStack {
            ZStack {
                // 外框
                RoundedRectangle(cornerRadius: 30)
                    .stroke(LinearGradient(gradient: Gradient(colors: [.accentColor, .gray]), startPoint: .top, endPoint: .bottom), lineWidth: 10)
                    .shadow(radius: 10)
                    .frame(width: 400, height: 500)
                    .padding(20)
                
                VStack {
                    // 標題
                    Text("水見式小遊戲")
                        .font(.custom("JasonHandwriting7p", size: 50))
                        .foregroundColor(.accentColor)
                        .offset(y: 80)
                    
                    ZStack {
                        if ability == "放出系" {
                            // 圖形旋轉形成閃光，在背後所以寫最上面
                            ForEach(0..<8) { index in
                                StarShape()
                                    .fill(Color.yellow.opacity(isShining ? 0.5 : 0.0))
                                    .frame(width: 150, height: 150)
                                    .scaleEffect(isShining ? 1.5 : 1.0)
                                    .rotationEffect(.degrees(Double(index) * 30))
                                    .offset(y: -20)
                                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isShining)
                            }
                            .onAppear {
                                isShining = true
                            }
                        }
                        
                        // 顯示水杯圖片
                        if currentImage == nil {
                            Image("水杯")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 400, height: 400)
                                .opacity(opacity)
                                .onTapGesture {
                                    if !hasChosenAbility {
                                        withAnimation(.easeOut(duration: 1.0)) {
                                            opacity = 0.0 // 淡出水杯
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                            showRandomAbility()
                                            hasChosenAbility = true // 已選擇能力
                                            isTapped = true // 已點擊
                                        }
                                    }
                                }
                        }
                        
                        if let currentImage = currentImage {
                            currentImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 400, height: 400)
                                .opacity(opacity)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        opacity = 1.0 // 新能力圖像淡入
                                    }
                                }
                            if ability == "強化系" {
                                // 顯示水流圖片（強化系）
                                Image("水流出來")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 400, height: 400)
                                    .offset(y: -10)
                                    .opacity(waterFlowOpacity)
                                    .onAppear {
                                        startWaterFlowAnimation()
                                    }
                            } else if ability == "具現化系" {
                                // 顯示雜質圖片（具現化系）
                                Image("雜質")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 600, height: 600)
                                    .offset(y: -30)
                                    .opacity(impurityOpacity)
                                    .onAppear {
                                        startImpurityAnimation()
                                    }
                            } else if ability == "操作系" {
                                // 顯示葉子圖片（操作系）
                                Image("葉子")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 400, height: 400)
                                    .offset(x: leafOffset, y: 0)
                                    .onAppear {
                                        startLeafAnimation()
                                    }
                                    .clipped()
                            } else if ability == "變化系" {
                                // 顯示糖圖片（變化系）
                                Image("糖")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    .offset(x: 60, y: -100)
                                    .opacity(isVisible ? 1 : 0)
                                    .onAppear {
                                        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                            isVisible.toggle()
                                        }
                                    }
                            }
                        }
                    }
                    .frame(width: 400, height: 400)
                    .clipped()
                    
                    // 顯示選到的能力
                    if !ability.isEmpty {
                        Group {
                            Text("選到的能力：") + Text("\(ability)")
                                .foregroundStyle(Color.accentColor)
                                .underline()
                                .font(.title2)
                                .fontWeight(.bold)
                        }.offset(y: -50)
                    }
                    
                    // 控制點擊文字
                    if !isTapped {
                        Text("點擊水杯")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .offset(y: -50)
                            .opacity(isVisible ? 1 : 0)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                    isVisible.toggle()
                                }
                            }
                    } else {
                        Button(action: {
                            resetGame() // 初始化
                            showRandomAbility() // 重新選擇能力
                        }) {
                            Text("重新選擇能力")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .offset(y: -50)
                    }
                }
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 0.5)) {
                opacity = 1.0 // 圖像初始淡入
            }
        }
    }
    
    private func showRandomAbility() {
        let abilities = ["強化系", "放出系", "操作系", "變化系", "具現化系", "特質系"]
        ability = abilities.randomElement()!// 隨機選
        
        // 重置透明度
        opacity = 0.0
        waterFlowOpacity = 0.0
        impurityOpacity = 0.0
        sugarOpacity = 0.0
        
        switch ability {
        case "強化系", "放出系", "具現化系", "特質系", "變化系":
            currentImage = Image("水杯")
        case "操作系":
            currentImage = Image("水杯無葉子")
        default:
            currentImage = nil
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeIn(duration: 0.5)) {
                opacity = 1.0 // 水杯淡入
            }
        }
        
        // 延遲其他能力元素的動畫效果
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            switch self.ability {
            case "強化系":
                self.startWaterFlowAnimation() // 啟動水流動畫
            case "具現化系":
                self.startImpurityAnimation() // 啟動雜質動畫
            case "操作系":
                self.startLeafAnimation() // 啟動葉子動畫
            case "變化系":
                self.startSugarAnimation() // 啟動糖動畫
            default:
                break
            }
        }
    }
    // 重新初始化
    private func resetGame() {
        ability = ""
        currentImage = nil
        opacity = 1.0
        waterFlowOpacity = 0.0
        impurityOpacity = 0.0
        sugarOpacity = 0.0
        leafOffset = 0.0
        isShining = false
        hasChosenAbility = false
    }
    // 葉子移動
    private func startLeafAnimation() {
        withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: true)) {
            leafOffset = 20.0
        }
    }
    // 水閃爍
    private func startWaterFlowAnimation() {
        withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
            waterFlowOpacity = 1.0
        }
    }
    // 雜質閃爍
    private func startImpurityAnimation() {
        withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
            impurityOpacity = 1.0
        }
    }
    
    // 糖閃爍
    private func startSugarAnimation() {
        withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
            sugarOpacity = 1.0
        }
    }
}

#Preview {
    GameView()
}
