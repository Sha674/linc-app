//
//  MedicineView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 10/11/2025.
//

import SwiftUI

struct MedicineView: View {
    struct SectionData: Identifiable {
            let id = UUID()
            let title: String
            let fullText: String
        }

        // Example data
        let sections: [SectionData] = [
            SectionData(
                title: "Why is this important?",
                fullText: "Here’s a longer explanation about section 1. You can include as much text as you want here — paragraphs, notes, or detailed descriptions."
            ),
            SectionData(
                title: "Step-by-Step Guide",
                fullText: "Full content for section 2 goes here. It can include additional text or explanations, shown only when expanded."
            ),
            SectionData(
                title: "Things to Watch Out For",
                fullText: "Extended information for section 3, displayed when you tap 'Read More'."
            )
        ]
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Button(action: exit){
                Image(systemName: "xmark")
                    .foregroundStyle(Color(.purple))
                    .font(Font.largeTitle.bold())
                    .padding()
            }
            ScrollView{
                VStack(){
                    Spacer().frame(height:60)
                    Text("How medicine “A” supports the heart")
                        .font(Font.custom("Inter", size: 32).weight(.bold))
                        .lineSpacing(35)
                        .foregroundColor(Color(red: 0.14, green: 0.47, blue: 0.99))
                        .padding(.horizontal)
                        .multilineTextAlignment(.trailing)
                    
                    Text("Skipping doses may cause fatigue or shortness of breath.")
                        .font(Font.custom("Inter", size: 16))
                        .lineSpacing(24)
                        .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.32))
                        .multilineTextAlignment(.trailing)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 12){
                        Text("Primary Goal")
                            .font(Font.custom("Inter", size: 20).weight(.semibold))
                            .foregroundColor(Color(red: 0.25, green: 0.27, blue: 0.78))
                            .padding()
                       
                        Text("The primary goal is to help the heart function more effectively, ease symptoms such as breathlessness or fatigue, and prevent the condition from getting worse.")
                            .font(Font.custom("Inter", size: 14))
                            .lineSpacing(20)
                            .foregroundColor(.black)
                            .padding()
                    }
                    .frame(maxWidth: 335)
                    .background(.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
                    
                    Spacer().frame(height:20)

                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(sections) { section in
                            ExpandView(section: section)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
                
    }
    
    struct ExpandView:View {
        let section: MedicineView.SectionData
        @State private var isExpanded:Bool = false
        var body: some View {
            ZStack(alignment: .topTrailing){
                VStack(alignment: .leading, spacing: 8) {
                    Text(section.title)
                        .font(.headline)
                    
                    if isExpanded {
                        Text(section.fullText)
                            .font(.subheadline)
                            .transition(.opacity)
                    }
                }
                .frame(maxWidth: 335)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .shadow(radius: 1)
                Button(action: {
                    withAnimation(.easeInOut) {
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180:0))
                        .font(.system(size:16, weight: .bold))
                        .foregroundColor(.blue)
                        .padding()
                }
            }
        }
    }
    
    func exit() {
        
    }
}

#Preview {
    MedicineView()
}

