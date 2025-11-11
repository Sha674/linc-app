import SwiftUI

struct InsightBannerView: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 14) {
                Text("The first 24 hours are the most important!")
                    .font(.title2.weight(.bold))
                    .foregroundColor(.white)

                Text("Key insights for today.")
                    .font(.custom("Inter", size: 18))
                    .foregroundColor(Color(.systemGray5))
            }

            Spacer()
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("gradientStart"),
                    Color("gradientEnd")
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray5), lineWidth: 0.5)
        )
        .shadow(color: Color.black.opacity(0.06), radius: 9.7, y: 1)
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        Color(.systemGroupedBackground).ignoresSafeArea()
        InsightBannerView()
    }
}
