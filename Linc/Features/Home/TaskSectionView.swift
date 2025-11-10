import SwiftUI

struct TaskSectionView: View {
    let title: String
    let progress: String
    let tasks: [TaskItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // MARK: Section Header
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(LinearGradient(
                        gradient: Gradient(colors: [
                            Color("gradientStart"),
                            Color("gradientEnd")
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))

                Spacer()

                Text(progress)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color.primary700)
                    .padding(.horizontal, 8)
                    .frame(height: 26)
                    .background(Color.primary300)
                    .cornerRadius(8)
            }

            // MARK: Task list container
            VStack(alignment: .leading, spacing: 0) {
                ForEach(tasks.indices, id: \.self) { index in
                    TaskCardView(
                        title: tasks[index].title,
                        time: tasks[index].time,
                        note: tasks[index].note,
                        iconName: tasks[index].icon
                    )

                    if index != tasks.count - 1 {
                        Divider()
                            .background(Color(.systemGray5))
                    }
                }
            }
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray5), lineWidth: 0.5)
            )
            .shadow(color: Color.black.opacity(0.04), radius: 8, y: 1)
        }
    }
}

#Preview {
    TaskSectionView(
        title: "Morning",
        progress: "2/3",
        tasks: [
            TaskItem(title: "Check Morning Weight", time: "8:15 AM", note: "Before breakfast", icon: "weight"),
            TaskItem(title: "Administer Medication A", time: "8:30 AM", note: "1 tablet", icon: "medicine"),
            TaskItem(title: "Prepare Low-Salt Breakfast", time: "8:30 AM", note: "Ensure fluid ≤ 250 ml", icon: "cooking")
        ]
    )
    .padding()
    .background(Color(.systemGroupedBackground))
}
