//
//  AlertView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 11/11/2025.
//

import SwiftUI

struct AlertView: View {
    var body: some View {
        HStack(spacing: 73) {
            HStack(spacing: 16) {
                Image("alert").frame(width: 44, height: 44)
                VStack(alignment: .leading, spacing: 12) {
                    Text("Call 000 If Mom Has:")
                        .font(.system(size: 16))
                        .foregroundColor(Color.primary950)
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: .top, spacing: 8) {
                            HStack(spacing: 10) {
                                Text("Trouble breathing")
                                    .font(.system(size: 14, weight:.semibold))
                                    .foregroundColor(Color(red: 0.88, green: 0.05, blue: 0.05))
                            }
                            .padding(.horizontal)
                            .frame(height: 26)
                            .background(Color(red: 0.98, green: 0.75, blue: 0.75))
                            .cornerRadius(8)
                            HStack(spacing: 10) {
                                Text("Feels faint")
                                    .font(.system(size: 14, weight:.semibold))
                                    .foregroundColor(Color(red: 0.88, green: 0.05, blue: 0.05))
                            }
                            .padding(.horizontal, 8)
                            .frame(height: 26)
                            .background(Color(red: 0.98, green: 0.75, blue: 0.75))
                            .cornerRadius(8)
                        }
                        HStack(alignment: .top, spacing: 8) {
                            HStack(spacing: 10) {
                                Text("Chest pain or pressure")
                                    .font(.system(size: 14, weight:.semibold))
                                    .foregroundColor(Color(red: 0.88, green: 0.05, blue: 0.05))
                            }
                            .padding(.horizontal,8)
                            .frame(height: 26)
                            .background(Color(red: 0.98, green: 0.75, blue: 0.75))
                            .cornerRadius(8)
                        }
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 8, leading: 20, bottom: 12, trailing: 16))
        .background(Color(red: 0.99, green: 0.85, blue: 0.85))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .inset(by: 2)
                .stroke(Color(red: 1, green: 0.39, blue: 0.40), lineWidth: 2)
        )
    }
}

#Preview {
    AlertView()
}
