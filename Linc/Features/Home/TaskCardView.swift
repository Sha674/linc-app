import SwiftUI

struct TaskCardView: View {
    let title: String
    let time: String
    let note: String
    let iconName: String
    @State private var isChecked: Bool = false

    var body: some View {
        HStack(spacing: 16) {
            // Checkbox
            Button(action: { isChecked.toggle() }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(.systemGray6))
                        .frame(width: 24, height: 24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color(.systemGray3), lineWidth: 0.8)
                        )

                    if isChecked {
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
                Text(title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.primary)
                    .lineLimit(1)

                HStack(spacing: 6) {
                    Text(time)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)

                    Circle()
                        .fill(Color(.systemGray4))
                        .frame(width: 6, height: 6)

                    Text(note)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }

            Spacer()

            // Right-side icon
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(Color(.systemGray))
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(Color(.systemBackground))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray5), lineWidth: 0.8)
        )
        .cornerRadius(12)
    }
}

#Preview {
    VStack(spacing: 12) {
        TaskCardView(
            title: "Check Morning Weight",
            time: "8:15 AM",
            note: "Before breakfast",
            iconName: "weight"
        )
        TaskCardView(
            title: "Prepare Low-Salt Breakfast",
            time: "8:30 AM",
            note: "Ensure fluid ≤ 250 ml",
            iconName: "cooking"
        )
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
