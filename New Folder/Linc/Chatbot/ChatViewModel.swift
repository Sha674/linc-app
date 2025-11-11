

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
        messages.append(ChatMessage(text: text, isUser: true))

        let reply = bestAnswer(for: text)
            ?? "Sorry, I don’t have an answer for that yet."

        messages.append(ChatMessage(text: reply, isUser: false))
    }

    // MARK: - Word-boundary “contains” retrieval

    private func bestAnswer(for question: String) -> String? {
        let q = question.lowercased()
        let qTokens = tokenize(q)

        var bestItem: KnowledgeBase?
        var bestScore = 0

        for item in knowledgeBase {
            var score = 0

            // 1) Phrase matches on tags (word-boundary, supports multi-word tags)
            for tag in item.tags {
                if containsPhrase(q, tag) {
                    score += 4
                } else {
                    // 2) Single-word overlap (token intersection)
                    let tagTokens = tokenize(tag.lowercased())
                    let overlap = qTokens.intersection(tagTokens).count
                    score += overlap * 2
                }
            }

            // 3) Phrase match on title (helps when user mentions title words)
            if containsPhrase(q, item.title.lowercased()) {
                score += 3
            }

            if score > bestScore {
                bestScore = score
                bestItem = item
            }
        }

        return bestItem?.answer
    }

    // MARK: - Helpers

    /// Word-boundary "contains" for phrases.
    /// - For multi-word phrases: uses simple range(of:, case-insensitive).
    /// - For single words: uses \\bword\\b to avoid substring false positives.
    private func containsPhrase(_ text: String, _ phrase: String) -> Bool {
        let p = phrase.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !p.isEmpty else { return false }

        if p.contains(" ") {
            // Multi-word phrase: simple case-insensitive search
            return text.range(of: p, options: .caseInsensitive) != nil
        } else {
            // Single word: word-boundary regex
            let escaped = NSRegularExpression.escapedPattern(for: p)
            let pattern = "\\b\(escaped)\\b"
            return (try? NSRegularExpression(pattern: pattern, options: []))?
                .firstMatch(in: text, options: [], range: NSRange(text.startIndex..., in: text)) != nil
        }
    }

    /// Tokenize into normalized words, remove stopwords, light stemming (s/es/ing/ed).
    private func tokenize(_ text: String) -> Set<String> {
        let separators = CharacterSet.alphanumerics.inverted
        let raw = text.lowercased()
            .components(separatedBy: separators)
            .filter { !$0.isEmpty }

        let stop: Set<String> = [
            "a","an","the","and","or","but","if","then","than","to","of","in","on","for","with",
            "at","by","from","as","is","it","this","that","these","those","i","you","we","they",
            "be","are","am","was","were","been","being","do","does","did","have","has","had"
        ]

        func stem(_ w: String) -> String {
            // very light stemming for common English endings
            if w.hasSuffix("ing"), w.count > 4 { return String(w.dropLast(3)) }
            if w.hasSuffix("ed"),  w.count > 3 { return String(w.dropLast(2)) }
            if w.hasSuffix("es"),  w.count > 3 { return String(w.dropLast(2)) }
            if w.hasSuffix("s"),   w.count > 2 { return String(w.dropLast(1)) }
            return w
        }

        return Set(raw
            .filter { !stop.contains($0) }
            .map(stem))
    }
}
