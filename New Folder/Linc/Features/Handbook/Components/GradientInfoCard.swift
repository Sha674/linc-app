//
//  GradientInfoCard.swift
//  Linc
//
//  Created by UTSMac06 on 10/11/2025.
//
//  The The card at the top with: gradient background, icon, title, subtitle

import SwiftUI

struct GradientInfoCard: View {
    // 👇 Declare the inputs your card needs
    let title: String
    let subtitle: String
    let symbol: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Icon
            Image(systemName: symbol)
                .font(.system(size: 32))
                .foregroundStyle(
                    LinearGradient(colors: [.blue, .purple],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )
                .frame(width: 48, height: 48)
                .background(Circle().fill(Color.white))
                .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)

            // Texts
            VStack(alignment: .leading, spacing: 6) {
                // Gradient-styled title (blue→purple)
                Text(title)
                    .font(.headline)
                    .foregroundStyle(
                        LinearGradient(colors: [.blue, .purple],
                                       startPoint: .leading,
                                       endPoint: .trailing)
                    )

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.black.opacity(0.7))
            }

            Spacer()
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
    }
}
