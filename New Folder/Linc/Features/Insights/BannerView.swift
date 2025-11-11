//
//  BannerView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 11/11/2025.
//
import SwiftUI

struct BannerView: View {
    let name:String
    let days:String
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 14) {
                Text(name)
                    .font(.title2.weight(.bold))
                    .foregroundColor(.white)

                Text(days)
                    .font(.system(size:16, weight: .semibold))
                    .foregroundColor(Color(.systemGray5))
            }

            Spacer()
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("gradientStart"),
                    Color("gradientEnd")
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray5), lineWidth: 0.5)
        )
        .shadow(color: Color.black.opacity(0.06), radius: 9.7, y: 1)
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        Color(.systemGroupedBackground).ignoresSafeArea()
        BannerView(name: "Margaret Chen", days:"Day 1, Hour 1")
    }
}
