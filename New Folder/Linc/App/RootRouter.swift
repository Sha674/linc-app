//
//  RootRouter.swift
//  Linc
//
//  Created by Thanh Ngoc Le on 7/11/2025.
//

import SwiftUI

struct RootRouter: View {
    @EnvironmentObject private var app: AppState

    var body: some View {
        switch app.auth {
        case .loggedOut:
            LoginView()
        case let .awaitingCode(sessionId, who):
            CodeVerifyView(sessionId: sessionId, who: who)
        case .loggedIn:
            MainTabView()
        }
    }
}
