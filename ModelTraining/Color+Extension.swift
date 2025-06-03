//
//  Color+Extension.swift
//  GenAICoach
//
//  Created by Kyle Lei on 2025/6/1.
//

import SwiftUI

extension Color {
    // Background
    static let midnightOrbit = Color(red: 0.05, green: 0.05, blue: 0.15)
    static let deepVoid = Color(red: 0.02, green: 0.02, blue: 0.08)

    // Mesh gradient palette additions
    static let starlightBlue = Color(red: 0.4, green: 0.6, blue: 1.0) // 亮點
    static let plasmaPink = Color(red: 1.0, green: 0.6, blue: 0.8)     // 補色偏紅
    static let violetNebula = Color(red: 0.5, green: 0.4, blue: 0.9)   // 過渡主色
    static let abyssPurple = Color(red: 0.1, green: 0.0, blue: 0.2)    // 陰影
    
    static let lunarWhite = Color(red: 0.95, green: 0.96, blue: 1.0)     // 主文字：高對比淺白藍
    static let orbitGray = Color(red: 0.75, green: 0.78, blue: 0.88)     // 次文字：安靜理性灰藍
    static let plasmaCyan = Color(red: 0.4, green: 1.0, blue: 1.0)       // 高亮標示或互動元素
    static let haloAmber = Color(red: 1.0, green: 0.85, blue: 0.4)       // 強調提示、警告
}
