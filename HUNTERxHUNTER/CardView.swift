//
//  3dCard.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/11/12.
//

import SwiftUI

struct CardView: View {
    //let scale: Double
    @State private var rotation: Double = 0
    var body: some View {
        Image(.獵人執照)
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 350)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
            //.scaleEffect(scale)
            .rotation3DEffect(
                .degrees(rotation),
                axis: (x: 0, y: 1, z: 0)
            )
            .onAppear {
                withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
    }
}


#Preview {
    //CardView(scale: 1)
}
