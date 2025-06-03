//
//  ModelTraining.swift
//  ModelTraining
//
//  Created by Kyle Lei on 2025/6/3.
//

import Foundation

struct ModelTraining: Identifiable {
    let id = UUID()
    let name: String
    let stage: String
    let progress: Double
    let lastUpdate: String
    let isSecondary: Bool
    
    let currentEpoch: Int
    let totalEpochs: Int
    let learningRate: Double
    let estimatedTimeLeft: String
    let accuracy: Double
    let latestLoss: Double
    let history: [TrainingData]

    init(name: String, stage: String, progress: Double, lastUpdate: String, isSecondary: Bool, currentEpoch: Int, totalEpochs: Int, learningRate: Double, estimatedTimeLeft: String, accuracy: Double, latestLoss: Double, history: [TrainingData]) {
        self.name = name
        self.stage = stage
        self.progress = progress
        self.lastUpdate = lastUpdate
        self.isSecondary = isSecondary
        self.currentEpoch = currentEpoch
        self.totalEpochs = totalEpochs
        self.learningRate = learningRate
        self.estimatedTimeLeft = estimatedTimeLeft
        self.accuracy = accuracy
        self.latestLoss = latestLoss
        self.history = history
    }
}

struct TrainingData: Identifiable {
    let id = UUID()
    let x: Int
    let accuracy: Double
    let loss: Double
}
