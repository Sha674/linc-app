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
                VStack(spacing: 20) {
                    // Large heading
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Know Better, Care with")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(Color.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Confidence")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(Color.purple)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 4)
                    
                    // Gradient tip card
                    GradientInfoCard(
                        title: "How medicine A supports the heart",
                        subtitle: "Skipping doses may cause fatigue or shortness of breath.",
                        symbol: "pills"
                    )
                    .padding(.horizontal, 16)
                    
                    // Section + list
                    VStack(spacing: 12) {
                        SectionHeader(
                            title: "Why this care matters?",
                            counterText: "\(completed)/\(items.count)"
                        )
                        .padding(.horizontal, 20)
                        
                        VStack(spacing: 12) {
                            ForEach(items.indices, id: \.self) { idx in
                                KnowledgeRow(item: items[idx]) {
                                    markRead(at: idx)
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Handbook")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func markRead(at index: Int) {
        guard items.indices.contains(index) else { return }
        if items[index].state == .unread {
            items[index].state = .read
        }
    }
}
