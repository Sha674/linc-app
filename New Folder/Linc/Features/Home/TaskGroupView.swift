import SwiftUI

struct TaskGroupView: View {
    // Keep local mutable state so we can pass bindings to TaskSectionView
    @State private var sectionsState: [SectionState]
    private let maxHeight: CGFloat?

    // Public initializer matching current call sites (CareView and this preview)
    // Thêm tham số maxHeight để cố định chiều cao vùng cuộn bên trong
    init(sections: [TaskSectionData], maxHeight: CGFloat? = nil) {
        self._sectionsState = State(
            initialValue: sections.map { SectionState(title: $0.title, tasks: $0.tasks) }
        )
        self.maxHeight = maxHeight
    }

    var body: some View {
        // Container đứng yên
        VStack(alignment: .leading, spacing: 0) {
            // Nội dung cuộn: danh sách các section
            Group {
                if let maxHeight {
                    ScrollView(.vertical, showsIndicators: false) {
                        content
                            .padding(.vertical, 20)
                            .padding(.horizontal, 20)
                    }
                    .frame(height: maxHeight)
                } else {
                    // Hành vi cũ: không cố định chiều cao => không cuộn
                    content
//                        .padding(.vertical, 20)
//                        .padding(.horizontal, 20)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.primary200, lineWidth: 0.5)
        )
        .shadow(color: Color.black.opacity(0.12), radius: 8.5, y: 3)
        //padding(.horizontal, 20)
    }

    // MARK: - Extracted content (list of sections)
    private var content: some View {
        VStack(alignment: .leading, spacing: 44) {
            ForEach($sectionsState) { $section in
                TaskSectionView(title: section.title, tasks: $section.tasks)
            }
        }
    }
}

// MARK: - Local mutable section state
private struct SectionState: Identifiable {
    let id = UUID()
    var title: String
    var tasks: [TaskItem]
}

// MARK: - Data Model (input)
struct TaskSectionData {
    let title: String
    let progress: String
    let tasks: [TaskItem]
}

#Preview {
    // Preview với vùng cuộn cố định 420pt
    TaskGroupView(
        sections: [
            TaskSectionData(
                title: "Morning",
                progress: "2/3",
                tasks: [
                    TaskItem(title: "Check Morning Weight", time: "8:15 AM", note: "Before breakfast", icon: "weight"),
                    TaskItem(title: "Administer Furosemide", time: "8:30 AM", note: "1 tablet", icon: "medicine"),
                    TaskItem(title: "Prepare Low-Salt Breakfast", time: "8:30 AM", note: "Ensure fluid ≤ 250 ml", icon: "cooking")
                ]
            ),
            TaskSectionData(
                title: "Afternoon",
                progress: "2/2",
                tasks: [
                    TaskItem(title: "Support Light Walk", time: "2:00 PM", note: "15-20 mins", icon: "walk"),
                    TaskItem(title: "Check Blood Pressure", time: "3:30 PM", note: "Record in app", icon: "blood")
                ]
            ),
            TaskSectionData(
                title: "Evening",
                progress: "0/2",
                tasks: [
                    TaskItem(title: "Weigh Before Dinner", time: "6:40 PM", note: "Track daily change", icon: "weight"),
                    TaskItem(title: "Administer Evening Medication", time: "8:30 PM", note: "2 tablets", icon: "medicine")
                ]
            )
        ],
        maxHeight: 420
    )
    .padding()
    .background(Color(.systemGroupedBackground))
}
