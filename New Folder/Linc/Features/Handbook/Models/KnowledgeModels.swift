//
//  KnowledgeModels.swift
//  Linc
//
//  Created by UTSMac06 on 10/11/2025.
//

import Foundation

public enum ReadState: String, Codable {
    case unread = "Unread"
    case read = "Read"
}

public struct KnowledgeItem: Identifiable, Hashable, Codable {
    public var id: UUID = UUID()
    public var title: String
    public var excerpt: String
    public var state: ReadState
    public var symbol: String
}
