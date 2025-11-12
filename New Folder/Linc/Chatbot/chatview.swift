//
//  chatview.swift
//  Linc
//
//  Created by JJ on 11/11/2025.
//
import SwiftUI
import Combine

private struct HeaderBackground: View {
    var body: some View {
        ZStack {
            // base
            Color.white

            // big soft circles in the top-right
            Circle()
                .fill(Color(red: 0.95, green: 0.96, blue: 1.40))   // very light lavender
                .frame(width: 320, height: 320)
                .offset(x: 160, y: -60)

            Circle()
                .fill(Color(red: 0.92, green: 0.90, blue: 1.00))   // slightly deeper
                .frame(width: 220, height: 220)
                .offset(x: 160, y: -60)
                .blur(radius: 1.5)

            // optional subtle highlight sweep
            RadialGradient(
                colors: [Color.white.opacity(0.7), .clear],
                center: .topTrailing,
                startRadius: 0, endRadius: 240
            )
        }
    }
}

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
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Need clarity? Just ask.")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(titleGradient)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("I can help you understand symptoms, daily tasks,\nor when to contact your doctor.")
                        .padding(.bottom, 18)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 20)
                .padding(.top, -40) // small breathing room
                .background(HeaderBackground())

                Divider()
                    .frame(height: 2)
                    .background(Color(.systemGray3))
                    .padding(.horizontal, -24)
            }
            // Keep safe area inset top spacing without a button
            .safeAreaInset(edge: .top) {
                Color.clear
                    .frame(height: 12)
            }

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
                .background(pageBG)
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
                        .padding(15)
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
            .background(pageBG)
        }
        // Quan trọng: bỏ ignoresSafeArea(.keyboard) để hệ thống tự đẩy input lên
        // .ignoresSafeArea(.keyboard, edges: .bottom)
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
// Page background (very light lavender)
private let pageBG = Color(red: 0.97, green: 0.97, blue: 1.00)

// User bubble gradient
private let userGradient = LinearGradient(
    colors: [
        Color(red: 0.33, green: 0.37, blue: 0.97),
        Color(red: 0.55, green: 0.32, blue: 0.99)
    ],
    startPoint: .leading, endPoint: .trailing
)

// Assistant bubble fill (soft lavender)
private let assistantGradient = LinearGradient(
    colors: [
        Color(red: 0.93, green: 0.94, blue: 1.00),
        Color(red: 0.96, green: 0.95, blue: 1.00)
    ],
    startPoint: .topLeading, endPoint: .bottomTrailing
)

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
                .background {
                    if message.isUser {
                        userGradient
                            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    } else {
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(assistantGradient) // lighter lavender
                            .overlay(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .stroke(Color(red: 0.86, green: 0.86, blue: 0.95), lineWidth: 1)
                            )
                            .shadow(color: .black.opacity(0.24), radius: 1, y: 1)
                    }
                }
                .foregroundColor(message.isUser ? .white : Color.primary.opacity(0.85))
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
