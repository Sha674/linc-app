//
//  GradientInfoCard.swift
//  Linc
//
//  Created by UTSMac06 on 10/11/2025.
//
//  Updated to match Figma style using system fonts and brand colors.
//

import SwiftUI

struct GradientInfoCard: View {
    let title: String
    let subtitle: String
    let imageName: String?

    init(title: String, subtitle: String, imageName: String?) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
    }

    init(title: String, subtitle: String, symbol: String?) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = symbol
    }

    var body: some View {
        HStack(spacing: 24) {
            // 48x48 icon container
            ZStack {
                if let imageName, !imageName.isEmpty {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipped()
                        .accessibilityHidden(true)
                }
            }
            .frame(width: 48, height: 48)

            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.primary700)
                    .multilineTextAlignment(.leading)

                Text(subtitle)
                    .font(.system(size: 18))
                    .foregroundColor(Color.black.opacity(0.7))
                    .multilineTextAlignment(.leading)
            }
        }
        // Increase horizontal padding so text has more room to wrap
        .padding(EdgeInsets(top: 16, leading: 24, bottom: 20, trailing: 24))
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.primary300, lineWidth: 0.5)
        )
        .shadow(color: Color.black.opacity(0.06), radius: 9.7, y: 1)
    }
}

#Preview("GradientInfoCard – Light") {
    GradientInfoCard(
        title: "How medicine A supports the heart",
        subtitle: "Skipping doses may cause fatigue or shortness of breath.",
        imageName: "medicine2"
    )
}
