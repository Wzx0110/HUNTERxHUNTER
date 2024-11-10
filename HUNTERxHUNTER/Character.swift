//
//  Character.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/10/23.
//


import Foundation

struct Character: Identifiable, Hashable {
    let id = UUID()
    let type: String
    let name: String
    let image: String
    let gender: String
    let age: String
    let height: String
    let ability: String
    let description: String
}
