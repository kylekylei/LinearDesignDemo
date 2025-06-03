//
//  ModelTrainingView.swift
//  ModelTraining
//
//  Created by Kyle Lei on 2025/6/3.
//

import SwiftUI

struct ModelTrainingView: View {
    let models = [
        ModelTraining(
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
        ),
        ModelTraining(
            name: "Whisper",
            stage: "Validation",
            progress: 0.60,
            lastUpdate: "1h ago",
            isSecondary: true,
            currentEpoch: 30,
            totalEpochs: 50,
            learningRate: 0.0005,
            estimatedTimeLeft: "45m",
            accuracy: 0.921,
            latestLoss: 0.3021,
            history: [
                TrainingData(x: 1, accuracy: 0.7, loss: 1.2),
                TrainingData(x: 2, accuracy: 0.75, loss: 0.9),
                TrainingData(x: 3, accuracy: 0.8, loss: 0.6),
                TrainingData(x: 4, accuracy: 0.81, loss: 0.5)
            ]
        ),
        ModelTraining(
            name: "ResNet-50",
            stage: "Inference",
            progress: 0.85,
            lastUpdate: "15m ago",
            isSecondary: true,
            currentEpoch: 85,
            totalEpochs: 100,
            learningRate: 0.0002,
            estimatedTimeLeft: "20m",
            accuracy: 0.978,
            latestLoss: 0.1568,
            history: [
                TrainingData(x: 1, accuracy: 0.7, loss: 1.2),
                TrainingData(x: 2, accuracy: 0.75, loss: 0.9),
                TrainingData(x: 3, accuracy: 0.8, loss: 0.6),
                TrainingData(x: 4, accuracy: 0.81, loss: 0.5)
            ]
        )
    ]
    
    let gridItems =  Array(repeating: GridItem(.flexible(), spacing: 16, alignment: .top), count: 3)

    var body: some View {
        DashboardCardWithHighlight(title: "Model Training", icon: "brain.head.profile") {
            LazyVGrid(columns: gridItems, alignment: .leading, spacing: 8) {
                ForEach(models) { model in
                    ModelTrainingCard(model: model)
                }
            }
        }
    }
}

#Preview {
    ModelTrainingView()
        .frame(width: 1000, height: 500)
        .preferredColorScheme(.dark)
}
