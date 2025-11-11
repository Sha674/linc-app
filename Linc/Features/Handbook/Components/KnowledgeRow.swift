//
//  KnowledgeRow.swift
//  Linc
//
//  Created by UTSMac06 on 10/11/2025.
//
//  Updated styling to match Figma while using system fonts and brand primary colors.
//

import SwiftUI

struct KnowledgeRow: View {
    var item: KnowledgeItem
    var onTap: () -> Void
    
    private var badgeText: String {
        item.state.rawValue
    }
    
    // Brand palette choices
    private var titleColor: Color { Color.primary700 }
    private var chipBgColor: Color { Color.primary100 }
    private var borderColor: Color { Color.primary200 }
    private var shadowColor: Color { Color.black.opacity(0.04) }
    
    // Badge colors depending on state
    private var badgeBackgroundColor: Color {
        switch item.state {
        case .unread:
            return Color(.systemGray5)
        case .read:
            return Color(.systemGreen).opacity(0.2)
        }
    }
    
    private var badgeTextColor: Color {
        switch item.state {
        case .unread:
            return Color(.systemGray)
        case .read:
            return Color(.systemGreen)
        }
    }
    
    var body: some View {
        HStack(spacing: 16) {
            // Text block
            VStack(alignment: .leading, spacing: 12) {
                // Title + badge, aligned on first text baseline
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(item.title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(titleColor)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    
                    // Badge container: align its baseline to the text inside
                    ZStack {
                        Text(badgeText)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(badgeTextColor)
                            .padding(.horizontal, 8)
                            .frame(height: 24)
                            .background(badgeBackgroundColor)
                            .cornerRadius(8)
                    }
                    // Force the badge’s alignment to the text baseline rather than its 24pt frame
                    .alignmentGuide(.firstTextBaseline) { d in
                        // Use the text’s baseline inside (approximate: bottom minus small inset)
                        d[.bottom] - 4
                    }
                    .fixedSize(horizontal: true, vertical: true)
                }
                
                Text(item.excerpt)
                    .font(.system(size: 18))
                    .foregroundColor(Color.black.opacity(0.7))
                    .multilineTextAlignment(.leading)
            }
            .layoutPriority(1) // Ensure text gets layout space before the arrow chip
            .padding(8)
            Spacer()
            
            // Trailing action chip
            Button(action: onTap) {
                ZStack {
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 16, weight: .bold))
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
                }
                .frame(width: 22, height: 22)
                .padding(12)
                .background(chipBgColor)
                .cornerRadius(100)
            }
            .buttonStyle(.plain)
            .fixedSize()
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 14, trailing: 16))
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(borderColor, lineWidth: 0.5)
        )
        .shadow(color: Color.black.opacity(0.04), radius: 14.4, y: 1)
        .contentShape(Rectangle())
        .onTapGesture(perform: onTap)
    }
}

#Preview {
    VStack(spacing: 24) {
        KnowledgeRow(
            item: KnowledgeItem(
                title: "Low-Salt Breakfast",
                excerpt: "Helps reduce swelling and shortness of breath.",
                state: .unread,
                symbol: "fork.knife"
            ),
            onTap: {}
        )
        KnowledgeRow(
            item: KnowledgeItem(
                title: "Daily Monitoring",
                excerpt: "Catch early signs of fluid build-up.",
                state: .read,
                symbol: "stethoscope"
            ),
            onTap: {}
        )
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
