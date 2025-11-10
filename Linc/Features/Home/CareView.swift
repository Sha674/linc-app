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
        TaskItem(title: "Support Light Walk", time: "2:00 PM", note: "15–20 mins", icon: "walk"),
        TaskItem(title: "Check Blood Pressure", time: "3:30 PM", note: "Record in app", icon: "blood")
    ]

    var body: some View {
        ZStack(alignment: .top) {
            Color.primary100.ignoresSafeArea()

            ScrollView {
                // Đo offset trong không gian tọa độ của ScrollView
                GeometryReader { geo in
                    Color.clear
                        .preference(
                            key: ScrollOffsetPreferenceKey.self,
                            value: geo.frame(in: .named("scroll")).minY
                        )
                }
                .frame(height: 0)

                VStack(spacing: 24) {
                    InsightBannerView()
                    TaskGroupView(sections: [
                        TaskSectionData(title: "Morning", progress: "0/\(morningTasks.count)", tasks: morningTasks),
                        TaskSectionData(title: "Afternoon", progress: "0/\(afternoonTasks.count)", tasks: afternoonTasks)
                    ])
                }
                .padding(.top, 70)
            }
//            .coordinateSpace(name: "scroll")
//            // Nếu cần chừa 16pt để không dính sát mép dưới, dùng safeAreaInset thay vì padding nội dung
//            .safeAreaInset(edge: .bottom) {
//                Color.clear.frame(height: 16)
//            }

            HeaderView(scrollOffset: scrollOffset)
                .background(.primary100)
        }
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            // Khi cuộn xuống, minY âm => offset dương
            scrollOffset = -value
        }
    }
}

#Preview {
    CareView()
        .preferredColorScheme(.light)
}
