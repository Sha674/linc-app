//
//  AppState.swift
//  Linc
//
//  Created by Thanh Ngoc Le on 7/11/2025.
//

import SwiftUI
import Combine

final class AppState: ObservableObject {
    enum Auth {
        case loggedOut
        case awaitingCode(sessionId: String, who: String)
        case loggedIn
    }
    var name: String = "Linc"
    @Published var auth: Auth = .loggedOut
}
