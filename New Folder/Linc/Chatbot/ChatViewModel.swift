//
//  ChatViewModel.swift
//  Linc
//
//  Created by JJ on 11/11/2025.
//

import Foundation
import SwiftUI
import Combine


final class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = [
        ChatMessage(text: "Hi, how can I help you?", isUser: false)
    ]

    func send(_ rawText: String) {
        let text = rawText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }

        // 1. Add the user message
        messages.append(ChatMessage(text: text, isUser: true))

        // 2. Find the best answer from your local knowledge base
        let reply = bestAnswer(for: text)
            ?? "Sorry, I don’t have an answer for that yet."

        // 3. Add the assistant reply
        messages.append(ChatMessage(text: reply, isUser: false))
    }
}

