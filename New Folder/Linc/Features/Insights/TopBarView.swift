//
//  TopBarView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 11/11/2025.
//

import SwiftUI

struct TopBarView: View {
    var onBack: (() -> Void)? = nil

    var body: some View {
        HStack {
            // Left: Back arrow + title
            HStack(spacing: 8) {
                // Back button with minimum 44x44 hit area
                Button(action: { onBack?() }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 18, height: 18, alignment: .center)
                        .contentShape(Rectangle())
                }
                // Ensure at least 44x44 tappable area
                .frame(width: 44, height: 44, alignment: .center)

                Text("24 Hours Checklist ")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }

            Spacer()

            // Right: Call button
            HStack(spacing: 8) {
                Image("call")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)

                Text("Call 000")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(red: 1, green: 0.22, blue: 0.24))
            }
            .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 8))
            .background(Color(red: 0.99, green: 0.85, blue: 0.85))
            .cornerRadius(8)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 6)
        .frame(maxWidth: .infinity)
        // Increase header height to provide comfortable space
        .frame(height: 56) // was 50
        .background(.white)
    }
}

#Preview {
    TopBarView()
}
