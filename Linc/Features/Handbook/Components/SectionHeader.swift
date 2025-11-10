//
//  SectionHeader.swift
//  Linc
//
//  Created by UTSMac06 on 10/11/2025.
//
//  Reusable section header with counter (ex."Why this matters?")

import SwiftUI

struct SectionHeader: View {
    var title: String
    var counterText: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text(counterText)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(Capsule().fill(Color(.systemGray6)))
        }
    }
}
