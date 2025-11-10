//
//  BottomBarView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 10/11/2025.
//

import SwiftUI


struct BottomBarView:View {
    var body: some View {
        HStack() {
            Button(action: {
                print("tapped")
            }) {
                Link("Find out more", destination: URL(string: "https://www.apple.com")!)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 150, height: 30)
                    .padding()
                    .background(Color.primary200)
                    .cornerRadius(100)
                
//                    Text("Find out more")
//                        .font(.system(size: 16, weight: .semibold))
//                        .foregroundColor(.black)
//                        .frame(width: 150, height: 30)
//                        .padding()
//                        .background(Color.primary200)
//                        .cornerRadius(100)
            }
            
            Button(action: {
                print("tapped")
            }) {
                Text("Got that!")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 150, height: 30)
                    .padding()
                    .background(Color.primary700)
                    .cornerRadius(100)
            }
        }
        .padding()
        .background(Color.primary50)
    }
}

#Preview {
    BottomBarView()
}
