import SwiftUI

struct TaskCardView: View {
    @Binding var task: TaskItem

    var body: some View {
        HStack(spacing: 16) {
            // Checkbox
            Button(action: { task.isCompleted.toggle() }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(.systemGray6))
                        .frame(width: 24, height: 24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color(.systemGray3), lineWidth: 0.8)
                        )

                    if task.isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 18, height: 18)
                            .background(Color.accentColor)
                            .cornerRadius(4)
                            .transition(.scale)
                    }
                }
            }
            .buttonStyle(.plain)

            // Task details
            VStack(alignment: .leading, spacing: 8) {
                Text(task.title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(task.isCompleted ? .secondary : .primary)
                    .strikethrough(task.isCompleted)
                    .lineLimit(1)

                HStack(spacing: 6) {
                    Text(task.time)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)

                    Circle()
                        .fill(Color(.systemGray4))
                        .frame(width: 6, height: 6)

                    Text(task.note)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }

            Spacer()

            Image(task.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(Color(.systemGray))
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
    }
}

private struct TaskCardView_PreviewWrapper: View {
    @State private var example = TaskItem(title: "Check Morning Weight", time: "8:15 AM", note: "Before breakfast", icon: "weight")

    var body: some View {
        TaskCardView(task: $example)
            .padding()
            .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    TaskCardView_PreviewWrapper()
}
