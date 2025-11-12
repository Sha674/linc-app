//
//  MedicineView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 10/11/2025.
//

import SwiftUI

struct MedicineView: View {
    let content:ContentData
    // Callback to notify parent when user confirms
    var onConfirm: (() -> Void)? = nil
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var showTabView: Bool
    
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(){
                ScrollView(showsIndicators: false){
                    VStack(spacing:24){
                        VStack(alignment: .trailing, spacing:10){
                            Spacer().frame(height:100)
                            Text(content.mainTitle)
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
                            
                            Text(content.subtitle)
                                .font(.system(size: 18))
                                .foregroundColor(Color.secondary)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        VStack(spacing: 20) {
                            GoalView(goalContent: content.goalContent)
                            ForEach(content.sections) { section in
                                ExpandView(section: section)
                            }
                        }
                        
                    }
                    .frame(width: 370, alignment: .center)
                    .padding(.horizontal,24)
                    .padding(.bottom, 100)
                }
                BottomBarView(
                    onConfirm: {
                        onConfirm?()
                        dismiss()
                    }, link:content.links
                )
                .frame(height: 100)
                
            }
            .ignoresSafeArea()
        }
        .onAppear {
            // Ẩn Tab Bar khi vào màn chi tiết
            showTabView = false
        }
        .onDisappear {
            // Khôi phục Tab Bar khi rời màn chi tiết
            showTabView = true
        }
    }
}

func exit() { }

#Preview {
    MedicineView(content: ContentSamples.lowSaltDiet, showTabView: .constant(false)
    )
}
