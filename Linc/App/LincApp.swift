//
//  LincApp.swift
//  Linc
//
//  Created by Thanh Ngoc Le on 7/11/2025.
//

import SwiftUI

@main
struct LincApp: App {
    @StateObject private var app  = AppState()   // login state
    @StateObject private var care = CareStore()  // shared store (stub below)

    var body: some Scene {
        WindowGroup {
            RootRouter()
                .environmentObject(app)
                .environmentObject(care)
        }
    }
}
