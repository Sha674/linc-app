

import Foundation

struct KnowledgeBase: Identifiable {
    let id: Int
    let title: String
    let tags: [String]
    let answer: String
}

let knowledgeBase: [KnowledgeBase] = [
    KnowledgeBase(
        id: 1,
        title: "Normal tiredness after discharge",
        tags: ["tired", "tiredness", "fatigue", "energy", "normal"],
        answer: "It’s common to feel more tired in the first days after going home..."
    ),
    KnowledgeBase(
        id: 2,
        title: "When to call the doctor about weight",
        tags: ["weight", "scale", "2 kg", "gain", "fluid"],
        answer: "Call your doctor if weight goes up by 2 kg or more in 2 days..."
    )
    
    // Put more info after
]

func bestAnswer(for question: String) -> String? {
    let lower = question.lowercased()
    
    // Score each item by how many tags appear in the question
    let scored = knowledgeBase.map { item -> (KnowledgeBase, Int) in
        let score = item.tags.filter { lower.contains($0) }.count
        return (item, score)
    }
    
    // Pick the item with the highest score
    if let best = scored.max(by: { $0.1 < $1.1 }), best.1 > 0 {
        return best.0.answer
    } else {
        return nil // or a default "sorry, I don't know" message
    }
}



