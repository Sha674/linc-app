//
//  Onboarding.swift
//  Linc
//
//  Created by Thanh Ngoc Le on 7/11/2025.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var app: AppState
    var body: some View {
        VStack(spacing: 16) {
            Text("Login").font(.title)
            Button("Continue → enter code") {
                app.auth = .awaitingCode(sessionId: "demo", who: "you@example.com")
            }
        }.padding()
    }
}

struct CodeVerifyView: View {
    @EnvironmentObject var app: AppState
    let sessionId: String
    let who: String
    var body: some View {
        VStack(spacing: 16) {
            Text("Code sent to \(who)")
            Button("Verify (demo)") { app.auth = .loggedIn }
        }.padding()
    }
}
