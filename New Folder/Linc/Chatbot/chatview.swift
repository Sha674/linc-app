//
//  chatview.swift
//  Linc
//
//  Created by JJ on 11/11/2025.
//
import SwiftUI
import Combine

// MARK: - Model types needed by this view

struct chatview: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let isUser: Bool
}


// MARK: - View

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var inputText: String = ""

    // gradient used for the title text (similar to your design)
    private var titleGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 0.36, green: 0.52, blue: 1.0),
                Color(red: 0.71, green: 0.44, blue: 1.0)
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    var body: some View {
        VStack(spacing: 0) {

// MARK: - Header
            VStack(alignment: .leading, spacing: 6) {
                // Gradient title text
                titleGradient
                    .mask(
                        Text("Need clarity? Just ask.")
                            .font(.system(size: 30, weight: .bold))
                    )

                Text("I can help you understand symptoms, daily tasks,\nor when to contact your doctor.")
                    .padding(.bottom, 12)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    
                
            }
            .padding(.horizontal, 40)                 // less side padding
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 120, alignment: .bottom)
            .background(Color.white)

            Divider()
                .frame(height: 2)
                .background(Color(.systemGray3))
                .padding(.horizontal, -24)

// MARK: - Messages list
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            ChatBubble(message: message)
                                .padding(.horizontal, 14)
                        }
                        Spacer(minLength: 10)
                    }
                    .padding(.top, 16)
                }
                
                .background(Color(.systemGroupedBackground))
                
                .onChange(of: viewModel.messages.count) { _ in
                    
                    // scroll to last message
                    
                    if let last = viewModel.messages.last {
                        withAnimation {
                            proxy.scrollTo(last.id, anchor: .bottom)
                            
                        }
                    }
                }
            }

// MARK: - Input bar
            HStack(spacing: 8) {
                TextField("Type your question here…", text: $inputText, axis: .vertical)
                    .textFieldStyle(.plain)
                    .padding(.vertical, 13)
                    .padding(.horizontal, 14)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: Color.black.opacity(0.05), radius: 4, y: 1)

                Button {
                    viewModel.send(inputText)
                    inputText = ""
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.36, green: 0.52, blue: 1.0),
                                    Color(red: 0.71, green: 0.44, blue: 1.0)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(Circle())
                }
                .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color(.systemGroupedBackground))
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

// MARK: - Available width preference

private struct AvailableWidthKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// MARK: - One bubble

struct ChatBubble: View {
    let message: ChatMessage
    @State private var availableWidth: CGFloat = 0

    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
            }
            Text(message.text)
                .padding(.vertical, 10)
                .padding(.horizontal, 14)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.33, green: 0.37, blue: 0.97),
                            Color(red: 0.55, green: 0.32, blue: 0.99)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                .frame(
                    maxWidth: availableWidth > 0 ? availableWidth * 0.7 : .infinity,
                    alignment: message.isUser ? .trailing : .leading
                )
            

            if !message.isUser {
                Spacer()
            }
        }
        .background(
            GeometryReader { proxy in
                Color.clear
                    .preference(key: AvailableWidthKey.self, value: proxy.size.width)
            }
        )
        .onPreferenceChange(AvailableWidthKey.self) { width in
            self.availableWidth = width
        }
        .id(message.id)
    }
}

// MARK: - Preview

#Preview {
    ChatView()
}
