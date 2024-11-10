//
//  Ability.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/10/31.
//


import Foundation

struct Ability: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let text: String
    let description: String
}
