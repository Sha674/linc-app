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
    let mainTitle:String
    let subtitle:String
    let goalContent: String
    
    
    var body: some View {
        ZStack{
            BackgroundView()
            ZStack(alignment: .topLeading){
                Button(action: exit){
                    Image(systemName: "xmark")
                        .foregroundStyle(Color.primary700)
                        .font(Font.largeTitle.bold())
                        .padding()
                }
                ScrollView{
                    VStack(){
                        VStack(alignment: .trailing, spacing:10){
                            Spacer().frame(height:50)
                            Text(mainTitle)
                                .font(.system(size: 36, weight: .bold))
                                .lineSpacing(10)
                                .foregroundStyle(LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color("gradientStart"),
                                        Color("gradientEnd")
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                                .multilineTextAlignment(.trailing)
                                .padding(.horizontal)
                            
                            Text(subtitle)
                                .font(.system(size: 18, weight: .regular))
                                .lineSpacing(5)
                                .foregroundColor(Color(red: 0.22, green: 0.26, blue: 0.32))
                                .multilineTextAlignment(.trailing)
                                .padding(.horizontal)
                        }
                        VStack(alignment: .leading){
                            Text("Primary Goal")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color.primary700)
                                .padding(10)
                            
                            Text(goalContent)
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .padding([.horizontal, .bottom], 10)
                        }
                        .containerRelativeFrame(.horizontal){width, _ in width*0.8}
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
                        
                        Spacer().frame(height:20)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(sections) { section in
                                ExpandView(section: section)
                            }
                        }
                    }
                }
                VStack{
                    Spacer()
                    BottomBar()
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
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color.primary700)
                    
                    if isExpanded {
                        Text(section.fullText)
                            .font(.subheadline)
                            .transition(.opacity)
                    }
                }
                .containerRelativeFrame(.horizontal){width, _ in width*0.8}
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
                        .font(.system(size:16, weight: .bold))
                        .foregroundColor(Color.primary600)
                        .padding()
                }
            }
        }
    }
    
    struct BottomBar:View {
        var body: some View {
            HStack() {
                Button(action: {
                    print("tapped")
                }) {
                    Text("Find out more")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 150, height: 30)
                        .padding()
                        .background(Color.primary200)
                        .cornerRadius(100)
                }
                
                Button(action: {
                    print("tapped")
                }) {
                    Text("Got that!")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 150, height: 30)
                        .padding()
                        .background(Color.primary600)
                        .cornerRadius(100)
                }
            }
            .padding(EdgeInsets(top: 13, leading: 16, bottom: 13, trailing: 16))
            .background(Color.primary50)
        }
    }
    
    func exit() {
        
    }
}

#Preview {
    MedicineView(mainTitle: "How medicine “A” supports the heart", subtitle: "Skipping doses may cause fatigue or shortness of breath.", goalContent: "The primary goal is to help the heart function more effectively, ease symptoms such as breathlessness or fatigue, and prevent the condition from getting worse.")
}

