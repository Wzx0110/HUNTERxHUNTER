//
//  AbilityData.swift
//  HUNTERxHUNTER
//
//  Created by 翁子翔 on 2024/10/31.
//

import SwiftUI

struct AbilityData {
    static let abilities = [
        Ability(image: "水杯強化系",
                text:"水的質量改變，通常是增加，有時也會減少",
                description: "強化系：增強自己或武器本來的性質。可將攻擊、防守和療傷等能力發揮到極致的系。屬於此系的人可將念注入不同物體以獲得增加其強度的效果，如小傑的必殺技‧猜猜拳就是將念注入拳以增加其攻擊力；而將念注入劍後亦可做成折不斷的劍。"),
        Ability(image: "水杯放出系",
                text: "水的顏色改變",
                description: "放出系：氣在身體以外仍可以保持威力，可以發到遠離身體的地方。將身體的氣放出。放出的氣可改變外型、攻擊敵人或執行命令。任何要將氣作用在身體以外都會用到此類屬性 而且越遠越明顯，經過修練甚至可以做到瞬間移動。此類屬性是最常運用念獸的。"),
        Ability(image: "水杯操作系",
                text: "葉片會移動，好像有助於變魔術",
                description: "操作系：可將自身的念注入物件從而控制之（如注入他人體內，可控制他人）。但對物件良好的操控需要大量的練習和技巧。只要是用念控制自己以外的物件(生物、能量...)都會用到此類屬性，此外此類屬性還可以做到\"自動\"，例如 \"金\"的錄音帶 就是預先設定條件\"自動\"發動念。"),
        Ability(image: "水杯變化系",
                text: "水的味道改變，不同的人會改變成不同的味道",
                description: "變化系：可將產生的氣的形狀以及性質改變（如奇犽將氣變化為電流進行攻擊）。當氣與自己身體相連時威力巨大，一旦脫離就會威力驟減。只要是改變念的形狀或性質都會用到此類屬性，但是不管如何改變仍然保有\"能量\"的性質。"),
        Ability(image: "水杯具現化系",
                text: "水中出現結晶體類的東西",
                description: "具現化系：可將自己的氣的形態改造成自己想要的東西，即將氣實物化，可用氣製造出實實在在的武器進行攻擊，如酷拉皮卡的鎖鏈。理論上可以具現出任何東西(物質、空間、念能力、意識...)，通常具現物只要一離開身體就會消失 但是藉由修練可以設定出消失條件(會失去\"收放自如\"的優點)。"),
        Ability(image: "水杯",
                text: "發生不同於其他五系的現象皆屬於特質系",
                description: "特質系：不屬於以上五系的念能力皆分為此類。在六角形圖中分在操作系與具現化系之間是因為屬於這兩系的人比較容易轉變為特質系。")
        ]
}
