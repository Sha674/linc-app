import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home
    @State private var barHeight: CGFloat = 0 // measure floating bar height
    
    enum Tab {
        case home
        case handbook
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: - Tab Content
            Group {
                switch selectedTab {
                case .home:
                    CareView()
                case .handbook:
                    HandbookHomeView()
                }
            }
            // Reserve space equal to floating bar height
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: max(barHeight, 0))
            }
            .ignoresSafeArea(edges: .bottom)

            // MARK: - Floating Navigation Bar
            HStack(spacing: 12) {
                // Home Button
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        selectedTab = .home
                    }
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 18, weight: .semibold))
                        Text("Home")
                            .font(.system(size: 14, weight: .bold))
                    }
                    .foregroundColor(selectedTab == .home ? .white : Color.primary600)
                    .padding(10)
                    .frame(width: 100)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color("gradientStart"),
                                Color("gradientEnd")
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .opacity(selectedTab == .home ? 1 : 0)
                    )
                    .cornerRadius(20)
                }

                // Handbook Button
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        selectedTab = .handbook
                    }
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "book.fill")
                            .font(.system(size: 18, weight: .semibold))
                        Text("Handbook")
                            .font(.system(size: 14))
                    }
                    .foregroundColor(selectedTab == .handbook ? .white : Color.primary600)
                    .padding(10)
                    .frame(width: 100)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color("gradientStart"),
                                Color("gradientEnd")
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .opacity(selectedTab == .handbook ? 1 : 0)
                    )
                    .cornerRadius(20)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(Color.primary100)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.primary400, lineWidth: 0.5)
            )
            .shadow(color: Color.black.opacity(0.08), radius: 9.3, y: 1)
            .padding(.bottom, 12)
            // Measure the floating bar height (including its paddings)
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear { barHeight = proxy.size.height + 12 /* bottom padding */ }
                        .onChange(of: proxy.size.height) { _, newValue in
                            barHeight = newValue + 12
                        }
                }
            )
        }
        .animation(.easeInOut(duration: 0.25), value: selectedTab)
    }
}

#Preview {
    MainTabView()
        .preferredColorScheme(.light)
}
