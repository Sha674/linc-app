import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home
    @State private var barHeight: CGFloat = 0 // measure floating bar height
    
    // Popup state lifted to top-level to cover navbar/tab bar
    @State private var showingDetail: Bool = false
    @State private var popupTask: TaskItem?
    @State private var popupOnSave: (() -> Void)?

    // Track whether we are inside a detail screen (e.g., MedicineView)
    @State private var isInDetail: Bool = false
    
    @State private var showTabView: Bool = true

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
                    CareView(
                        onRequestPopup: { task, onSave in
                            // Build content for popup at top level
                            self.popupTask = task
                            self.popupOnSave = onSave
                            withAnimation(.spring(response: 0.28, dampingFraction: 0.9)) {
                                self.showingDetail = true
                            }
                        },
                        showTabView: $showTabView
                    )
                case .handbook:
                    HandbookHomeView(showTabView: $showTabView)
                }
            }
            // Reserve space equal to floating bar height only when bar is visible
            .safeAreaInset(edge: .bottom) {
                if !isInDetail {
                    Color.clear.frame(height: max(barHeight, 0))
                }
            }
            .ignoresSafeArea(edges: .bottom)

            if showTabView == true {
                // MARK: - Floating Navigation Bar (hidden on detail screens)
                if !isInDetail {
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
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
                
                // MARK: - Top-level Popup Overlay (covers everything)
                if showingDetail, let task = popupTask {
                    ZStack {
                        // Darker overlay color on top of blur
                        Color.black.opacity(0.80)
                            .ignoresSafeArea()
                            .transition(.opacity)
                        
                        // Popup content
                        TaskDetailView(
                            task: task,
                            isPresented: Binding(
                                get: { showingDetail },
                                set: { newValue in
                                    withAnimation(.spring(response: 0.28, dampingFraction: 0.9)) {
                                        showingDetail = newValue
                                    }
                                    if newValue == false {
                                        // clear when dismissed
                                        popupTask = nil
                                        popupOnSave = nil
                                    }
                                }
                            ),
                            onSave: {
                                // Propagate to caller (CareView) to mark done
                                popupOnSave?()
                                withAnimation(.spring(response: 0.28, dampingFraction: 0.9)) {
                                    showingDetail = false
                                }
                                popupTask = nil
                                popupOnSave = nil
                            }
                        )
                        .padding(.horizontal, 32) // updated from 20 to 36
                        .padding(.bottom, 20)
                        .transition(
                            .asymmetric(
                                insertion: .opacity.combined(with: .scale(scale: 0.96)),
                                removal: .opacity.combined(with: .scale(scale: 0.96))
                            )
                        )
                    }
                    // Prevent touches to content below
                    .allowsHitTesting(true)
                }
            }
        }
        .animation(.easeInOut(duration: 0.25), value: selectedTab)
        .animation(.easeInOut(duration: 0.2), value: isInDetail)
    }
}

#Preview {
    MainTabView()
        .preferredColorScheme(.light)
}
