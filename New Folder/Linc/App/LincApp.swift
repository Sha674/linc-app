//
//  LincApp.swift
//  Linc
//
//  Created by Thanh Ngoc Le on 7/11/2025.
//

import SwiftUI

@main
struct LincApp: App {
    @State private var isLoggedIn = false
    var body: some Scene {
        WindowGroup {
//            OnboardingView()
            HandbookHomeView()
        }
    }
}
