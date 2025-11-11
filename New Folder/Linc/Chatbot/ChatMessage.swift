//
//  ChatMessage.swift
//  Linc
//
//  Created by JJ on 11/11/2025.
//

import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool   // true = purple bubble on the right, false = grey bubble on the left
}

