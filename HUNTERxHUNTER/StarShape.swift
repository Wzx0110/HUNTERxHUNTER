//
//  StarShape.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/11/2.
//
import SwiftUI

struct StarShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let starPath = Path { path in
            let centerX = width / 2
            let centerY = height / 2
            let pointsOnStar = 5
            let adjustment = CGFloat(Double.pi / 2)
            let radius: CGFloat = min(width, height) / 2
            
            for i in 0..<pointsOnStar {
                let angle = adjustment + (Double(i) * (Double.pi * 2) / Double(pointsOnStar))
                let x = centerX + radius * cos(angle)
                let y = centerY + radius * sin(angle)
                if i == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
            path.closeSubpath()
        }
        return starPath
    }
}

#Preview {
    StarShape()
}
