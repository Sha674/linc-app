import Foundation

struct TaskItem: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let note: String
    let icon: String
}
