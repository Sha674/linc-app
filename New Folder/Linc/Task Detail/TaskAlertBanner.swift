import SwiftUI

struct TaskAlertBanner: View {
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            // Icon
            Image(systemName: "phone.fill")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color(red: 1, green: 0.22, blue: 0.24))

            // Text
            Text(text)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(red: 1, green: 0.22, blue: 0.24))
                .multilineTextAlignment(.leading)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.99, green: 0.85, blue: 0.85)) //
        .cornerRadius(8)
    }
}

#Preview {
    VStack(spacing: 20) {
        TaskAlertBanner(text: "Call doctor if +2 kg in 2 days.")
        TaskAlertBanner(text: "Contact nurse if heart rate > 110 bpm.")
    }
    .padding()
    .background(Color.primary50)
}
