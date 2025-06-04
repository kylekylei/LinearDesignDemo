//
//  DashboardCardWithHighlight.swift
//  ModelTraining
//
//  Created by Kyle Lei on 2025/6/3.
//

import SwiftUI

struct DashboardCardWithHighlight<Content: View>: View {
    let title: String
    let icon: String
    let content: Content
    @State private var rotationAngle: Double = 0
    
    init(title: String, icon: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                Image(systemName: icon)
                Text(title)
                Spacer()
            }
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(.white)
            
            content
        }
        .padding(20)
        .background(
            // Translucent Fill
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.08),
                            Color.white.opacity(0.02)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    // Base Border
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.1),
                                    Color.white.opacity(0.05)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
                .overlay(
                    // Rotating Highlight
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            AngularGradient(
                                colors: [
                                    Color.clear,
                                    Color.clear,
                                    Color.clear,
                                    Color.lunarWhite,
                                    Color.clear,
                                    Color.clear,
                                    Color.clear
                                ],
                                center: .center,
                                angle: .degrees(rotationAngle)
                            ),
                            lineWidth: 1
                        )
                        .blur(radius: 1)
                )
        )
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .onAppear {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                rotationAngle = 360
            }
        }
    }
}
