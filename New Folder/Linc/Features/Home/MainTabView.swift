//
//  MainTabView.swift
//  Linc
//
//  Created by Thanh Ngoc Le on 7/11/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Home")     .tabItem { Label("Home", systemImage: "house") }
            Text("Handbook") .tabItem { Label("Handbook", systemImage: "book") }
        }
    }
}
