//
//  HandbookHomeView.swift
//  Linc
//
//  Created by UTSMac06 on 10/11/2025.
//
//  This is the main Handbook home screen. It uses: section header, gradient card, scroll view, list of KnowledgeRow, data from your models

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
    
    private var completed: Int { items.filter { $0.state == .read }.count }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: -50) {
                    VStack {
                        // Large heading
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Know Better, Care with")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundStyle(LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color("gradientStart"),
                                        Color("gradientEnd")
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                            Text("Confidence")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundStyle(LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color("gradientStart"),
                                        Color("gradientEnd")
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                        }
                        
                        .padding(.horizontal,10)
                        .padding(.top, 12)
                        
                        // Gradient tip card
                        GradientInfoCard(
                            title: "How medicine A supports the heart",
                            subtitle: "Skipping doses may cause fatigue or shortness of breath.",
                            symbol: "pills"
                        )
                        .padding(.horizontal, 16)
                    }
                    .padding(.vertical, 60)
                    .background(Color.white)
                    
                    
                    // Section + list
                    VStack(spacing: -130) {
                        SectionHeader(
                            title: "Why this care matters?",
                            counterText: "\(completed)/\(items.count)"
                        )
                        .padding(.vertical, -175)
                        .padding(.horizontal, 10)
                        
                        VStack(spacing: 15) {
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
            
            .navigationTitle("Handbook")
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea()
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
    NavigationStack {
        TabView {
            // Mock Home tab (placeholder)
            Text("Home")
                .tabItem { Label("Home", systemImage: "house") }

            // Your real Handbook screen
            HandbookHomeView()
                .tabItem { Label("Handbook", systemImage: "book") }
        }
    }
    .environment(\.colorScheme, .light)
}

#Preview("Handbook – Dark") {
    NavigationStack {
        HandbookHomeView()
    }
    .environment(\.colorScheme, .dark)
}
