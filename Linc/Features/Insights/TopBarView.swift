//
//  TopBarView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 11/11/2025.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack() {
            HStack(spacing: 4) {
                HStack(spacing: 11) {
                    Button(action: exit) {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 18, weight: .bold))
                    }.frame(width: 24, height: 24)
                }
                .padding(.horizontal,5)
                Text("24 Hours Checklist ")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
            }
            Spacer()
            
            HStack(spacing: 8) {
                Image("call").frame(width: 24, height: 24)
                Text("Call 000")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(red: 1, green: 0.22, blue: 0.24))
            }
            .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 8))
            .background(Color(red: 0.99, green: 0.85, blue: 0.85))
            .cornerRadius(8)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(.white)
//        .overlay(
//            Rectangle()
//                .inset(by: 0.50)
//                .stroke(Color(red: 0.88, green: 0.89, blue: 0.92), lineWidth: 0.50)
//        )
    }
}


#Preview {
    TopBarView()
}
