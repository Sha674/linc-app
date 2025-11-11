//
//  ExpandView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 10/11/2025.
//

import SwiftUI

struct ExpandView:View {
    let section: MedicineView.SectionData
    @State private var isExpanded:Bool = false
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack(alignment: .leading, spacing: 8) {
                Text(section.title)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(Color.primary700)
                
                if isExpanded {
                    Text(section.fullText)
                        .font(.system(size: 16))
                        .transition(.opacity)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
//            .containerRelativeFrame(.horizontal){width, _ in width*0.8}
            .padding()
            .background(Color.primary50)
            .cornerRadius(12)
            .shadow(radius: 1)
            
            Button(action: {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()
                }
            }) {
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(isExpanded ? 180:0))
                    .font(.system(size:24, weight: .bold))
                    .foregroundColor(Color.primary600)
                    .padding()
            }
        }
    }
}


//#Preview {
//    ExpandView()
//}
