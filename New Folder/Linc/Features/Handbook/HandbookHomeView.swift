import SwiftUI


// Row model to pair visible info + the content to open
struct HandbookRow: Identifiable, Hashable {
    let id = UUID()
    var item: KnowledgeItem
    var content: ContentData?

    static func == (lhs: HandbookRow, rhs: HandbookRow) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct HandbookHomeView: View {
    @State private var rows: [HandbookRow] = [
        .init(
            item: KnowledgeItem(
                title: "Low-Salt Breakfast",
                excerpt: "Helps reduce swelling and shortness of breath.",
                state: .unread,
                symbol: "fork.knife"
            ),
            content: ContentSamples.lowSaltDiet
        ),
        .init(
            item: KnowledgeItem(
                title: "Track Fluids",
                excerpt: "Avoids putting extra strain.",
                state: .unread,
                symbol: "drop.triangle"
            ),
            content: ContentSamples.trackFluids
        ),
        .init(
            item: KnowledgeItem(
                title: "Daily Monitoring",
                excerpt: "Catch early signs of fluid build-up.",
                state: .unread,
                symbol: "stethoscope"
            ),
            content: ContentSamples.dailyMonitoring
        )
    ]

    @Binding var showTabView: Bool

    // Navigation selection for pushing MedicineView
    @State private var selectedRowID: HandbookRow.ID?

    private var totalCount: Int { rows.count }
    private var unreadCount: Int { rows.filter { $0.item.state == .unread }.count }
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

                            // Tip card leading to Medicine A (example)
                            NavigationLink(
                                destination: MedicineView(
                                    content: ContentSamples.medicineA,
                                    onConfirm: { /* optional no-op */ },
                                    showTabView: $showTabView
                                )
                            ) {
                                GradientInfoCard(
                                    title: "All about Furosemide",
                                    subtitle: "Skipping doses may cause fatigue or shortness of breath.",
                                    imageName: "medicine2"
                                )
                                .padding(.horizontal, 16)
                            }
                        }
                        .padding(.vertical, 60)
                    }
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.primary100)
                            .frame(height: 0.5)
                    }
                    .shadow(color: Color.black.opacity(0.04), radius: 8, y: 3)

                    // Section + list
                    VStack(spacing: -120) {
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
                            ForEach(rows.indices, id: \.self) { idx in
                                let row = rows[idx]
                                KnowledgeRow(item: row.item) {
                                    openDetail(forIndex: idx)
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
            .scrollIndicators(.hidden)
            .ignoresSafeArea()
            // Navigation destination for MedicineView
            .navigationDestination(item: Binding<HandbookRow?>(
                get: { selectedRowID.flatMap { id in rows.first(where: { $0.id == id }) } },
                set: { newValue in selectedRowID = newValue?.id }
            )) { selectedRow in
                if let content = selectedRow.content {
                    MedicineView(
                        content: content,
                        onConfirm: {
                            // mark read and pop back
                            markRead(byID: selectedRow.id)
                        },
                        showTabView: $showTabView // pass the real binding here
                    )
                } else {
                    Text("No content available.")
                        .padding()
                }
            }
        }
        .onAppear {
            showTabView = true
        }
    }

    private func openDetail(forIndex index: Int) {
        guard rows.indices.contains(index) else { return }
        if rows[index].content != nil {
            selectedRowID = rows[index].id
        }
    }

    private func markRead(byID id: HandbookRow.ID) {
        rows = rows.map { row in
            guard row.id == id else { return row }
            var updated = row
            updated.item.state = (row.item.state == .unread) ? .read : .unread
            return updated
        }
        selectedRowID = nil
    }
}

#Preview("Handbook – Light") {
    HandbookHomeView(showTabView: .constant(true))
        .environment(\.colorScheme, .light)
}
