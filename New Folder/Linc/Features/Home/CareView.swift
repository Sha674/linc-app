import SwiftUI

struct CareView: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var showingChat: Bool = false

    @State private var morningTasks = [
        TaskItem(title: "Check Morning Weight", time: "8:15 AM", note: "Before breakfast", icon: "weight"),
        TaskItem(title: "Administer Furosemide", time: "8:30 AM", note: "1 tablet", icon: "medicine"),
        TaskItem(title: "Prepare Low-Salt Breakfast", time: "8:30 AM", note: "Ensure fluid ≤ 250 ml", icon: "cooking")
    ]
    @State private var afternoonTasks = [
        TaskItem(title: "Support Light Walk", time: "2:00 PM", note: "15–20 mins", icon: "walk"),
        TaskItem(title: "Check Blood Pressure", time: "3:30 PM", note: "Record in app", icon: "blood"),
    ]
    @State private var eveningTasks = [
        TaskItem(title: "Weigh Before Dinner", time: "6:40 PM", note: "Track daily change", icon: "weight"),
        TaskItem(title: "Administer Evening Medication", time: "8:30 PM", note: "2 tablets", icon: "medicine"),
    ]

    var onRequestPopup: ((TaskItem, @MainActor @escaping () -> Void) -> Void)? = nil
    @Binding var showTabView: Bool
    @State private var showInsights: Bool = false

    enum SectionKind { case morning, afternoon, evening }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    HeaderView(scrollOffset: 0, onMessageTapped: {
                        showingChat = true
                    })
                    .background(.clear)

                    InsightBannerView()
                        .padding(.top, 8)
                        .padding(.bottom, 12)
                        .onTapGesture { showInsights = true }

                    GeometryReader { proxy in
                        let availableHeight = proxy.size.height
                        VStack(alignment: .leading, spacing: 0) {
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(alignment: .leading, spacing: 44) {
                                    TaskSectionView(
                                        title: "Morning",
                                        tasks: $morningTasks,
                                        onToggle: { idx in morningTasks[idx].isCompleted.toggle() },
                                        onCardTap: { idx in openDetail(for: SectionKind.morning, index: idx) }
                                    )
                                    TaskSectionView(
                                        title: "Afternoon",
                                        tasks: $afternoonTasks,
                                        onToggle: { idx in afternoonTasks[idx].isCompleted.toggle() },
                                        onCardTap: { idx in openDetail(for: SectionKind.afternoon, index: idx) }
                                    )
                                    TaskSectionView(
                                        title: "Evening",
                                        tasks: $eveningTasks,
                                        onToggle: { idx in eveningTasks[idx].isCompleted.toggle() },
                                        onCardTap: { idx in openDetail(for: SectionKind.evening, index: idx) }
                                    )
                                }
                                .padding(.vertical, 20)
                                .padding(.horizontal, 20)
                            }
                            .frame(height: availableHeight)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemBackground))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.primary200, lineWidth: 0.5)
                        )
                        .shadow(color: Color.black.opacity(0.12), radius: 8.5, y: 3)
                        .padding(.top, 8)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                    }
                }

                NavigationLink(isActive: $showInsights) {
                    InsightsView(showTabView: $showTabView)
                } label: { EmptyView() }
                .hidden()
            }
            .background(BackgroundView())
        }
        // Present ChatView as bottom sheet
        .sheet(isPresented: $showingChat) {
            ChatView()
                .presentationDetents([.medium, .large]) // iOS 16+
                .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Navigation / detail handling
    private func openDetail(for section: SectionKind, index: Int) {
        // Select the correct task by section/index
        let baseItem: TaskItem
        switch section {
        case .morning:
            guard morningTasks.indices.contains(index) else { return }
            baseItem = morningTasks[index]
        case .afternoon:
            guard afternoonTasks.indices.contains(index) else { return }
            baseItem = afternoonTasks[index]
        case .evening:
            guard eveningTasks.indices.contains(index) else { return }
            baseItem = eveningTasks[index]
        }

        // Enrich with insight/alert based on title
        let detailedItem = detailedTask(from: baseItem)

        // Ask MainTabView to present the popup
        onRequestPopup?(detailedItem) {
            // When user taps Save in the popup, toggle completion on the correct task
            switch section {
            case .morning:
                guard self.morningTasks.indices.contains(index) else { return }
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.morningTasks[index].isCompleted.toggle()
                }
            case .afternoon:
                guard self.afternoonTasks.indices.contains(index) else { return }
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.afternoonTasks[index].isCompleted.toggle()
                }
            case .evening:
                guard self.eveningTasks.indices.contains(index) else { return }
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.eveningTasks[index].isCompleted.toggle()
                }
            }
        }
    }

    // MARK: - Detail enrichment
    private func detailedTask(from item: TaskItem) -> TaskItem {
        var t = item
        let title = t.title.lowercased()

        if title.contains("weight") || title.contains("weigh") {
            t.insight = "Sudden weight gain can signal fluid retention — one of the earliest signs that heart failure is worsening."
            t.alert = "Call doctor if +2 kg in 2 days."
        } else if title.contains("medication") {
            t.insight = "Taking your medication on time helps maintain stable heart function."
            t.alert = "Call doctor if you miss doses and feel dizziness or shortness of breath."
        } else if title.contains("pressure") || title.contains("blood") {
            t.insight = "Regular BP checks help detect early changes in your condition."
            t.alert = "Call doctor if systolic > 180 or diastolic > 120."
        } else if title.contains("walk") {
            t.insight = "Light daily walks improve circulation and reduce symptoms."
            t.alert = "Stop and call doctor if chest pain or severe shortness of breath occurs."
        } else if title.contains("breakfast") || title.contains("salt") || title.contains("cooking") {
            t.insight = "Low-salt meals help reduce swelling and shortness of breath."
            t.alert = "Contact care team if swelling worsens despite low-salt diet."
        } else {
            t.insight = "Daily monitoring helps catch early signs of worsening symptoms."
            t.alert = nil
        }

        return t
    }
}
