import SwiftUI

struct TaskDetailContentView: View {
    let task: TaskItem

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Task summary card
            TaskSummaryCard(task: task)

            // Insight text
            if let insight = task.insight {
                Text(insight)
                    .font(.system(size: 16))
                    .foregroundColor(Color.primary900)
                    .lineSpacing(4)
            }

            // Alert banner
            if let alert = task.alert {
                TaskAlertBanner(text: alert)
            }
        }
        .padding(.horizontal, 20)
        //.padding(.vertical, 20)
        .background(Color.primary100)
    }
}

#Preview {
    TaskDetailContentView(
        task: TaskItem(
            title: "Check Morning Weight",
            time: "8:15 AM",
            note: "Before breakfast",
            icon: "weight",
            alert: "Call doctor if +2 kg in 2 days.",
            insight: "Sudden weight gain can signal fluid retention — one of the earliest signs that heart failure is worsening."
        )
    )
}
