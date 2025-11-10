import Foundation
import SwiftUI
import Combine


struct TaskDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var loggedWeight: String = "56.4"

    var body: some View {
        ZStack {
            // Dimmed background over the home screen
            Color.black.opacity(0.35)
                .ignoresSafeArea()
            

