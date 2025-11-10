// HealthTask.swift
import Foundation

struct HealthTask: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    let time: String
    let instruction: String
    let context: String
    let unit: String
    let warningThreshold: String?
}

// Sample data for previews
let exampleWeightTask = HealthTask(
    title: "Weight check",
    time: "Morning",
    instruction: "Before breakfast",
    context: "If your weight goes up by 2 kg in 2 days, call your doctor.",
    unit: "kg",
    warningThreshold: "weight increases by 2 kg in 2 days"
)
