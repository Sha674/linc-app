import SwiftUI

struct CareView: View {
    @State private var scrollOffset: CGFloat = 0

    @State private var morningTasks = [
        TaskItem(title: "Check Morning Weight", time: "8:15 AM", note: "Before breakfast", icon: "weight"),
        TaskItem(title: "Administer Medication A", time: "8:30 AM", note: "1 tablet", icon: "medicine"),
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

    var body: some View {
        ZStack(alignment: .top) {
            // Do not put BackgroundView as a child here
            VStack(spacing: 0) {
                HeaderView(scrollOffset: 0)
                    .background(.clear)

                InsightBannerView()
                    .padding(.top, 8)
                    .padding(.bottom, 12)

                GeometryReader { proxy in
                    let availableHeight = proxy.size.height
                    TaskGroupView(sections: [
                        TaskSectionData(title: "Morning", progress: "0/\(morningTasks.count)", tasks: morningTasks),
                        TaskSectionData(title: "Afternoon", progress: "0/\(afternoonTasks.count)", tasks: afternoonTasks),
                        TaskSectionData(title: "Evening", progress: "0/\(eveningTasks.count)", tasks: eveningTasks)
                    ], maxHeight: availableHeight)
                    .padding(.top, 8)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
            }
        }
        // Attach background to ZStack, not as a child layer
        .background(BackgroundView())
    }
}

#Preview {
    CareView()
        .preferredColorScheme(.light)
}
