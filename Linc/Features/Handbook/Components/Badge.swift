//
//  Badge.swift
//  Linc
//
//  Created by UTSMac06 on 10/11/2025.
//
//  A small reusable badge like: Unread (gray), Read (green)

import SwiftUI

struct Badge: View {
    var text: String
    var tint: Color
    
    var body: some View {
        Text(text)
            .font(.caption.weight(.semibold))
            .foregroundStyle(tint == .green ? .white : .secondary)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(
                Capsule(style: .continuous)
                    .fill(tint == .green ? Color.green : Color(.systemGray6))
            )
    }
}
