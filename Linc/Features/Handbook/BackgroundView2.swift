import SwiftUI

// White background for this variant
private let backgroundColorV2 = Color.white

struct BackgroundViewV2: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            backgroundColorV2
            // Outer circle (smaller, moved to the right)
            Circle()
                .fill(Color.primary200)
                .opacity(0.35)
                .frame(width: 300, height: 300) // smaller than 360
                .offset(x: 120, y: -100)        // push to the right/top

            // Inner circle (smaller, moved to the right)
            Circle()
                .fill(Color.primary200)
                .opacity(0.55)
                .frame(width: 210, height: 210) // smaller than 260
                .offset(x: 90, y: -70)          // push to the right/top
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundViewV2()
}
