//
//  BackgroundView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 10/11/2025.
//

import SwiftUI

let backgrounColor = Color.primary100

struct BackgroundView: View {
    
    var body: some View {
        ZStack (alignment: .topLeading){
            backgrounColor
            // Outer circle
            Circle()
                .fill(Color.primary200) // background color
                .opacity(0.5)
                .frame(width: 450, height: 450)
                .offset(x: -150, y: -150)
            
            // Inner ellipse
            Circle()
                .fill(Color.primary300)
                .opacity(0.5)
                .frame(width: 323.78, height: 323.78)
                .offset(x: -100, y: -100)
        }.ignoresSafeArea()
        
    }
}

#Preview {
    BackgroundView()
}
