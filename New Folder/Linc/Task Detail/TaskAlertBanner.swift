import SwiftUI

struct TaskAlertBanner: View {
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Icon
            Image(systemName: "phone.fill")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color(red: 1, green: 0.22, blue: 0.24))
                .padding(.top, 2) // căn icon với dòng đầu của text

            // Text
            Text(text)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(red: 1, green: 0.22, blue: 0.24))
                .multilineTextAlignment(.leading)
                .lineLimit(nil) // cho phép nhiều dòng
                .fixedSize(horizontal: false, vertical: true) // đảm bảo text bung chiều dọc
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.99, green: 0.85, blue: 0.85))
        .cornerRadius(8)
    }
}

#Preview {
    VStack(spacing: 20) {
        TaskAlertBanner(text: "Call doctor if +2 kg in 2 days.")
        TaskAlertBanner(text: "Contact nurse if heart rate > 110 bpm. If symptoms persist or worsen (e.g., dizziness, chest pain, or severe shortness of breath), seek immediate medical attention and do not wait for the next appointment.")
    }
    .padding()
    .background(Color.primary50)
}
