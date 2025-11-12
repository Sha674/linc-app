import Foundation

struct TaskItem: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let note: String
    let icon: String
    var isCompleted: Bool = false
    var alert: String? = nil
    var insight: String? = nil
}
