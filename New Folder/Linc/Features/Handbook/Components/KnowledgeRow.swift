//
//  KnowledgeRow.swift
//  Linc
//
//  Created by UTSMac06 on 10/11/2025.
//
//  The reusable row for each item: title, excerpt, badge (Unread / Read), arrow button icon

import SwiftUI

struct KnowledgeRow: View {
    var item: KnowledgeItem
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .center, spacing: 12) {
                // Leading symbol inside subtle circle
                ZStack {
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 40, height: 40)
                    Image(systemName: item.symbol)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.blue)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text(item.title)
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.blue)
                        Badge(text: item.state.rawValue,
                              tint: item.state == .read ? .green : .secondary)
                    }
                    Text(item.excerpt)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                Spacer()
                
                // Arrow in circle
                ZStack {
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 36, height: 36)
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.purple)
                }
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.systemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color(.systemGray5), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 3)
        }
        .buttonStyle(.plain)
    }
}
