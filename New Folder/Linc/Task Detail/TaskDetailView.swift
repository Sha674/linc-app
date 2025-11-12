import SwiftUI

struct TaskDetailView: View {
    let task: TaskItem
    @Binding var isPresented: Bool
    var onSave: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 0) {
            // MARK: Header
            TaskDetailHeader(title: task.title) {
                withAnimation(.easeInOut) {
                    isPresented = false
                }
            }

            // MARK: Content
            VStack(spacing: 0) {
                TaskDetailContentView(task: task)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.primary100)

                // Conditional input or save button
                if task.title.localizedCaseInsensitiveContains("weight") {
                    TaskLogInput(label: "Log today:", unit: "kg") {
                        onSave?()
                        isPresented = false
                    }
                } else {
                    VStack {
                        Button(action: {
                            onSave?()
                            isPresented = false
                        }) {
                            Text("Done")
                                .font(.system(size: 17, weight: .semibold))
                                .frame(maxWidth: .infinity, minHeight: 48)
                                .background(Color.primary700)
                                .foregroundColor(.white)
                                .cornerRadius(16)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 16)
                        .padding(.bottom, 20)
                    }
                    .background(Color.white)
                    .overlay(
                        Rectangle()
                            .stroke(Color.primary200, lineWidth: 0.5)
                    )
                }
            }
        }
        //.frame(width: 327)
        .background(Color.white)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primary300, lineWidth: 0.5)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 8, y: 4)
        .padding(.vertical, 16)
    }
}

#Preview {
    TaskDetailView(
        task: TaskItem(
            title: "Check Morning Weight",
            time: "8:15 AM",
            note: "Before breakfast",
            icon: "weight",
            alert: "Call doctor if +2 kg in 2 days.",
            insight: "Sudden weight gain can signal fluid retention — one of the earliest signs that heart failure is worsening."
        ),
        isPresented: .constant(true),
        onSave: {}
    )
    .padding()
    .background(Color.black.opacity(0.1))
    .preferredColorScheme(.light)
}
