//
//  BottomBarView.swift
//  Linc
//
//  Created by Suenn Wern Tan on 10/11/2025.
//

import SwiftUI

struct BottomBarView: View {
    var onConfirm: (() -> Void)?
    @State private var showSafari = false
    let link:String

    var body: some View {
        HStack() {
            Button(action: {
                showSafari=true
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
                onConfirm?()
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
        .sheet(isPresented: $showSafari) {
            SafariView(url: URL(string: link)!)}
    }
}

#Preview {
    BottomBarView(onConfirm: {}, link: "https://health.clevelandclinic.org/heart-failure-diet")
}
