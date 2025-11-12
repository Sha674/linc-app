//
//  LincApp.swift
//  Linc
//
//  Created by Thanh Ngoc Le on 7/11/2025.
//

import SwiftUI

@main
struct LincApp: App {
    @StateObject private var app = AppState()
    var body: some Scene {
        WindowGroup {
            if app.onboardingCompleted {
                MainTabView()
                    .environmentObject(app)
            } else {
                OnboardingView()
                    .environmentObject(app)
            }
        }
    }
}

