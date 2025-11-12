import SwiftUI

struct TaskDetailHeader: View {
    let title: String
    var onClose: (() -> Void)? = nil

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color.black)

            Spacer()

            Button(action: { onClose?() }) {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.gray)
                    .frame(width: 24, height: 24)
                    .background(Color.primary50)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .frame(height: 52)
        .background(Color(.systemBackground))
        .overlay(
            Rectangle()
                .inset(by: 0.5)
                .stroke(Color.primary200, lineWidth: 0.5)
        )
    }
}

#Preview {
    TaskDetailHeader(title: "Task Details") { print("Closed") }
        .previewLayout(.sizeThatFits)
        .background(Color.primary100)
}
