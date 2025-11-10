// TaskViewModel.swift
import Foundation
import Combine

final class TaskViewModel: ObservableObject {
    @Published var loggedValue: String = ""
    let task: HealthTask

    init(task: HealthTask) {
        self.task = task
    }
}
