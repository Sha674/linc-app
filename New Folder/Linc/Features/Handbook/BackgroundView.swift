//
//  BackgroundView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 10/11/2025.
//

import SwiftUI

let backgroundColor = Color.primary100

struct BackgroundView: View {
    
    var body: some View {
        ZStack (alignment: .topLeading){
            backgroundColor
            // Outer circle (smaller)
            Circle()
                .fill(Color.primary200) // background color
                .opacity(0.4)
                .frame(width: 360, height: 360) // was 450
                .offset(x: -120, y: -120)       // adjust offset to keep similar visual balance
            
            // Inner circle (smaller)
            Circle()
                .fill(Color.primary200)
                .opacity(0.6)
                .frame(width: 260, height: 260) // was 323.78
                .offset(x: -90, y: -90)         // adjust offset slightly
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
