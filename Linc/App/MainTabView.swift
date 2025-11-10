//
//  MainTabView.swift
//  Linc
//
//  Created by UTSMac06 on 10/11/2025.
//

import SwiftUI

struct MainTabView: View {
    @State private var selected = 1   // 0 = Home, 1 = Handbook

    var body: some View {
        TabView(selection: $selected) {
            // Replace Text with your real Home later
            Text("Home")
                .tabItem { Label("Home", systemImage: "house") }
                .tag(0)

            HandbookHomeView()
                .tabItem { Label("Handbook", systemImage: "book") }
                .tag(1)
        }
        .tint(.purple) // tab highlight color like your mock
    }
}
