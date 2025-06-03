//
//  ModelTrainingCard.swift
//  ModelTraining
//
//  Created by Kyle Lei on 2025/6/3.
//

import SwiftUI
import Charts


struct ModelTrainingCard: View {
    let model: ModelTraining
    @State private var animatedProgress: Double = 0
    @State private var showAdvancedInfo = true
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(model.name)
                        .font(.title3)
                        .foregroundColor(.lunarWhite)
                    
                    Spacer()
                    
                    Text("\(Int(model.progress * 100))%")
                        .font(.system(size: 14, weight: .medium, design: .monospaced))
                        .foregroundColor(.lunarWhite)
                    
                    Button(action: { showAdvancedInfo.toggle() }) {
                        Image(systemName: showAdvancedInfo ? "chevron.up" : "chevron.down")
                            .foregroundColor(.orbitGray)
                            .imageScale(.small)
                            .padding(8)
                            .background(Color.white.opacity(0.1), in: RoundedRectangle(cornerRadius: 6))
                        
                    }
                    .buttonStyle(.plain)
                }
                
                Text(model.stage)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(model.isSecondary ? .plasmaCyan.opacity(0.8) : .haloAmber.opacity(0.8))
                
                // Progress Bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.white.opacity(0.1))
                            .frame(height: 4)
                        
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: model.isSecondary ?
                                    [.plasmaCyan.opacity(0.6), .cyan.opacity(0.6)] :
                                    [.haloAmber.opacity(0.6), .orange.opacity(0.6)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: geo.size.width * animatedProgress, height: 4)
                            .shadow(color: model.isSecondary ? .plasmaCyan.opacity(0.5) : .haloAmber.opacity(0.5), radius: 4)
                    }
                }
                .frame(height: 4)
                
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("EPOCH")
                            .font(.caption)
                            .foregroundColor(.orbitGray)
                        Text("\(model.currentEpoch)/\(model.totalEpochs)")
                            .font(.callout)
                            .foregroundColor(.lunarWhite)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("ACCURACY")
                            .font(.caption)
                            .foregroundColor(.orbitGray)
                        Text(String(format: "%.2f%%", model.accuracy * 100))
                            .font(.callout)
                            .foregroundColor(.lunarWhite)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("TIME LEFT")
                            .font(.caption)
                            .foregroundColor(.orbitGray)
                        Text(model.estimatedTimeLeft)
                            .font(.callout)
                            .foregroundColor(.lunarWhite)
                    }
                }
                
                if showAdvancedInfo {
                    Divider().background(Color.gray.opacity(0.3))

                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("LEARNING RATE")
                                    .font(.caption)
                                    .foregroundColor(.orbitGray)
                                Text(String(format: "%.2e", model.learningRate))
                                    .font(.callout)
                                    .foregroundColor(.lunarWhite)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                Text("LATEST LOSS")
                                    .font(.caption)
                                    .foregroundColor(.orbitGray)
                                Text(String(format: "%.4f", model.latestLoss))
                                    .font(.callout)
                                    .foregroundColor(.lunarWhite)
                            }
                        }

                        Chart {
                            ForEach(model.history) { point in
                                LineMark(
                                    x: .value("Epoch", point.x),
                                    y: .value("Loss", point.loss)
                                )
                                .foregroundStyle(Color.orbitGray)
                                .lineStyle(StrokeStyle(lineWidth: 2))
                            }
                        }
                        .frame(height: 80)
                    }
                    .transition(.opacity)
                }
            }
            

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            LinearGradient(
                                colors: showAdvancedInfo ?
                                [.lunarWhite.opacity(0.6), .clear] :
                                [.haloAmber.opacity(0.3), .clear],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
                .shadow(color: .lunarWhite, radius: showAdvancedInfo ? 8 : 0, x: 0, y: 0)
        )
        .onAppear {
            withAnimation(.easeOut(duration: 1.5).delay(0.2)) {
                animatedProgress = model.progress
            }
        }
    }
}

#Preview {
    ModelTrainingCard(model:ModelTraining(
        name: "LLaMA-7B",
        stage: "Fine-tuning",
        progress: 0.24,
        lastUpdate: "14m ago",
        isSecondary: false,
        currentEpoch: 12,
        totalEpochs: 50,
        learningRate: 0.0001,
        estimatedTimeLeft: "2h 15m",
        accuracy: 0.812,
        latestLoss: 0.4987,
        history: [
            TrainingData(x: 1, accuracy: 0.7, loss: 1.2),
            TrainingData(x: 2, accuracy: 0.75, loss: 0.9),
            TrainingData(x: 3, accuracy: 0.8, loss: 0.6),
            TrainingData(x: 4, accuracy: 0.81, loss: 0.5)
        ]
    ))
    .preferredColorScheme(.dark)
    .padding()
    .frame(width: 500, height: 500)
}
