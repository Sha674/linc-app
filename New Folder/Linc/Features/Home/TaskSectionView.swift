import SwiftUI

struct TaskSectionView: View {
    let title: String
    @Binding var tasks: [TaskItem]

    var onToggle: ((Int) -> Void)?
    var onCardTap: ((Int) -> Void)?

    private var progressText: String {
        let remaining = tasks.filter { !$0.isCompleted }.count
        return "\(remaining)/\(tasks.count)"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // MARK: Section Header
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color(uiColor: .systemGray))

                Spacer()

                Text(progressText)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.primary700)
                    .padding(.horizontal, 8)
                    .frame(height: 26)
                    .background(Color.primary300)
                    .cornerRadius(8)
            }

            // MARK: Task list
            VStack(alignment: .leading, spacing: 0) {
                ForEach(tasks.indices, id: \.self) { idx in
                    TaskCardView(
                        task: $tasks[idx],
                        onToggle: { onToggle?(idx) },
                        onCardTap: { onCardTap?(idx) }
                    )

                    if tasks[idx].id != tasks.last?.id {
                        Divider()
                            .background(Color.primary50)
                    }
                }
            }
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.primary300, lineWidth: 0.5)
            )
            .shadow(color: Color.black.opacity(0.04), radius: 8, y: 1)
        }
    }
}

private struct TaskSectionView_PreviewWrapper: View {
    @State private var tasks = [
        TaskItem(title: "Check Morning Weight", time: "8:15 AM", note: "Before breakfast", icon: "weight"),
        TaskItem(title: "Administer Medication A", time: "8:30 AM", note: "1 tablet", icon: "medicine"),
        TaskItem(title: "Prepare Low-Salt Breakfast", time: "8:30 AM", note: "Ensure fluid ≤ 250 ml", icon: "cooking")
    ]

    var body: some View {
        TaskSectionView(
            title: "Morning",
            tasks: $tasks,
            onToggle: { idx in tasks[idx].isCompleted.toggle() },
            onCardTap: { _ in }
        )
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    TaskSectionView_PreviewWrapper()
}
