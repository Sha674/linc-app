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
    
    //Example Data
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
    let mainTitle:String
    let subtitle:String
    let goalContent: String
    
    // Callback to notify parent when user confirms
    var onConfirm: (() -> Void)? = nil
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(){
                ScrollView(showsIndicators: false){
                    VStack(spacing:24){
                        VStack(alignment: .trailing, spacing:10){
                            Spacer().frame(height:100)
                            Text(mainTitle)
                                .font(.system(size: 36, weight: .bold))
                                .multilineTextAlignment(.trailing)
                                .foregroundStyle(LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color("gradientStart"),
                                        Color("gradientEnd")
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                            
                            Text(subtitle)
                                .font(.system(size: 18))
                                .foregroundColor(Color.secondary)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        VStack(spacing: 20) {
                            GoalView(goalContent: goalContent)
                            ForEach(sections) { section in
                                ExpandView(section: section)
                            }
                        }
                        
                    }
                    .frame(width: 370, alignment: .center)
                    .padding(.horizontal,24)
                    .padding(.bottom, 100)
                }
                BottomBarView(
                    onLearnMore: {
                        // optional: handle learn more
                    },
                    onConfirm: {
                        onConfirm?()
                        dismiss()
                    }
                )
                .frame(height: 100)
                
            }
            .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {onConfirm?()}) {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color.primary700)
                            .font(.largeTitle.bold())
                    }
                    .padding(.horizontal,20)
                    .padding(.top,10)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

func exit() { }

#Preview {
    MedicineView(
        mainTitle: "How medicine “A” supports the heart",
        subtitle: "Skipping doses may cause fatigue or shortness of breath.",
        goalContent: "The primary goal is to help the heart function more effectively, ease symptoms such as breathlessness or fatigue, and prevent the condition from getting worse."
    )
}
