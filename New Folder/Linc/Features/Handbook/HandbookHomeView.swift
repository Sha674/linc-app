import SwiftUI

struct HandbookHomeView: View {
    @State private var items: [KnowledgeItem] = [
        .init(title: "Low-Salt Breakfast",
              excerpt: "Helps reduce swelling and shortness of breath.",
              state: .unread,
              symbol: "fork.knife"),
        .init(title: "Track Fluids",
              excerpt: "Avoids putting extra strain.",
              state: .unread,
              symbol: "drop.triangle"),
        .init(title: "Daily Monitoring",
              excerpt: "Catch early signs of fluid build-up.",
              state: .read,
              symbol: "stethoscope")
    
    ]
    
    @Binding var showTabView: Bool
    
    private var totalCount: Int { items.count }
    private var unreadCount: Int { items.filter { $0.state == .unread }.count }
    private var readCount: Int { totalCount - unreadCount }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: -50) {
                    // Header frame covering both title and tip card
                    ZStack {
                        BackgroundViewV2() // white background with circles on the right
                        
                        VStack {
                            // Title split across two lines, both left-aligned
                            HStack {
                                Text("Know Better,")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color("gradientStart"),
                                                Color("gradientEnd")
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 8)
                            
                            HStack {
                                Text("Care with Confidence.")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color("gradientStart"),
                                                Color("gradientEnd")
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 20)
                            
                            //Navigate to Medicine View
                            NavigationLink(destination: MedicineView(
                                content: ContentSamples.medicineA, showTabView: .constant(false)
                            )) {
                                // Gradient tip card
                                GradientInfoCard(
                                    title: "All about medicine A",
                                    subtitle: "Skipping doses may cause fatigue or shortness of breath.",
                                    imageName: "medicine2"
                                )
                                .padding(.horizontal, 16)
                            }
                            //                        .buttonStyle(.plain)
                            
                            
                        }
                        .padding(.vertical, 60)
                    }
                    // Apply bottom border and subtle shadow to the entire header block
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.primary100)
                            .frame(height: 0.5)
                    }
                    .shadow(color: Color.black.opacity(0.04), radius: 8, y: 3)
                    
                    // Section + list
                    VStack(spacing: -120) {
                        // Section Header (matched to TaskHeaderView style) — unread/total
                        HStack {
                            Text("Why this care matters?")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(Color(uiColor: .systemGray))
                            
                            Spacer()
                            
                            Text("\(unreadCount)/\(totalCount)")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color.primary700)
                                .padding(.horizontal, 8)
                                .frame(height: 26)
                                .background(Color.primary300)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .padding(.top, -175)
                        
                        VStack(spacing: 16) {
                            ForEach(items.indices, id: \.self) { idx in
                                KnowledgeRow(item: items[idx]) {
                                    markRead(at: idx)
                                }
                                .padding(.horizontal, 10)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 200)
                    .background(Color(.systemGroupedBackground))
                    .padding(.top, 10)
                }
            }
            .scrollIndicators(.hidden) // Ẩn thanh scroll indicator
            .ignoresSafeArea()
        }
        .onAppear {
            showTabView = true
        }
    }
    
    private func markRead(at index: Int) {
        guard items.indices.contains(index) else { return }
        if items[index].state == .unread {
            items[index].state = .read
        }
    }
}
#Preview("Handbook – Light") {
    HandbookHomeView(showTabView: .constant(true))
        .environment(\.colorScheme, .light)
}
