import SwiftUI

struct TaskSummaryCard: View {
    let task: TaskItem

    var body: some View {
        HStack(spacing: 12) {
            // MARK: - Text Content
            VStack(alignment: .leading, spacing: 8) {
                Text(task.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.primary900)
                    .lineLimit(1)
                    .truncationMode(.tail)

                HStack(spacing: 10) {
                    Text(task.time)
                        .font(.system(size: 15))
                        .foregroundColor(Color.primary600)
                        .lineLimit(1)
                        .truncationMode(.tail)

                    Circle()
                        .fill(Color.primary500)
                        .frame(width: 4, height: 4)

                    Text(task.note)
                        .font(.system(size: 15))
                        .foregroundColor(Color.primary600)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 10)

            Spacer()

            // MARK: - Icon
            Image(task.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(Color.primary500)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.primary200.opacity(0.7))
        .cornerRadius(8)
    }
}

#Preview {
    TaskSummaryCard(
        task: TaskItem(
            title: "Check Morning Weight Check Morning Weight Check Morning Weight",
            time: "8:15 AM very long text",
            note: "Before breakfast with additional very long description to test truncation.",
            icon: "weight"
        )
    )
    .padding()
    .background(Color.primary50)
}
