import SwiftUI

struct CircleImageButton: View {
    let imageName: String
    var action: (() -> Void)? = nil

    var body: some View {
        Button(action: { action?() }) {
            ZStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
            }
            .contentShape(Rectangle())
            .frame(width: 48, height: 48)
        }
        .buttonStyle(.plain)
        .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
    }
}

struct HeaderView: View {
    var scrollOffset: CGFloat = 0
    private let scrolledThreshold: CGFloat = 0.5

    // Callback khi bấm vào icon message
    var onMessageTapped: (() -> Void)? = nil

    private var isScrolled: Bool {
        scrollOffset > scrolledThreshold
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            // Background fill when scrolled
            (isScrolled ? Color.primary100 : Color.clear)
                .ignoresSafeArea(edges: .top)
                .animation(.easeInOut(duration: 0.2), value: isScrolled)

            // Header content
            HStack {
                HStack(spacing: 12) {
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Text("LINC")
                        .font(.system(size: max(20 - scrollOffset * 0.03, 16), weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color("gradientStart"), Color("gradientEnd")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .opacity(Double(max(1 - scrollOffset / 60, 0.6)))
                }

                Spacer()

                HStack(spacing: 12) {
                    CircleImageButton(imageName: "notification")
                    CircleImageButton(imageName: "message", action: { onMessageTapped?() })
                }
                .opacity(Double(max(1 - scrollOffset / 100, 0.8)))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 8)

            // Bottom border when scrolled
            if isScrolled {
                Divider()
                    .background(Color.primary200)
                    .frame(height: 0.8)
                    .transition(.opacity)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .zIndex(1)
        // Subtle shadow only when scrolled
        .shadow(color: isScrolled ? Color.black.opacity(0.06) : .clear, radius: 8, y: 3)
        .animation(.easeInOut(duration: 0.2), value: isScrolled)
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    ZStack {
        Color(.systemGroupedBackground).ignoresSafeArea()
        HeaderView(scrollOffset: 0, onMessageTapped: {})
    }
}
