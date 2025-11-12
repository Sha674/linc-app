//
//  GoalView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 10/11/2025.
//

import SwiftUI

struct GoalView: View {
    let goalContent: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Primary Goal")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(Color.primary700)
            //                .padding(.horizontal, 10)
            
            Text(goalContent)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .lineSpacing(4)
            //                .padding([.horizontal, .bottom], 10)
        }
        .padding(16)
        .frame(maxWidth: .infinity)

        //        .frame(minWidth: 370, maxWidth: 370, minHeight: 150)
        .background(.white)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)

//        .padding(.horizontal)
    }
}

#Preview {
    GoalView(goalContent: "The primary goal is to help the heart function more effectively, ease symptoms such as breathlessness or fatigue, and prevent the condition from getting worse.")
}
