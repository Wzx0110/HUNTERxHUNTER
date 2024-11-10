//
//  PhotoView.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/11/9.
//

import SwiftUI

struct PhotoView: View {
    var name: String
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(name)
                .resizable()
                .scaledToFill()
                .frame(width: 190, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .contrast(1.2)
                .brightness(0.05)
                .shadow(radius: 10)

            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.8)
                .frame(width: 190, height: 30)
                .cornerRadius(15)
            
            Text(name)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.bottom, 5)
        }
        .frame(height: 100)
    }
}

#Preview {
    PhotoView(name: "念能力")
}
