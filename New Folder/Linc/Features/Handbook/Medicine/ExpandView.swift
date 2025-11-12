////
////  ExpandView.swift
////  Linc
////
////  Created by Suenn Wern Tan on 10/11/2025.
////
//
//import SwiftUI
//
//struct ExpandView:View {
//    let section: MedicineView.SectionData
//    @State private var isExpanded:Bool = false
//    var body: some View {
//        ZStack(alignment: .topTrailing){
//            VStack(alignment: .leading, spacing: 8) {
//                Text(section.title)
//                    .font(.system(size: 24, weight: .semibold))
//                    .foregroundStyle(Color.primary700)
//                
//                if isExpanded {
//                    Text(section.fullText)
//                        .font(.system(size: 16))
//                        .transition(.opacity)
//                }
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding()
//            .background(Color.primary50)
//            .cornerRadius(12)
//            .shadow(radius: 1)
//            
//            Button(action: {
//                withAnimation(.easeInOut) {
//                    isExpanded.toggle()
//                }
//            }) {
//                Image(systemName: "chevron.down")
//                    .rotationEffect(.degrees(isExpanded ? 180:0))
//                    .font(.system(size:24, weight: .bold))
//                    .foregroundColor(Color.primary600)
//                    .padding()
//            }
//        }
//    }
//}
//
//
import SwiftUI

struct ExpandView: View {
    let section: SectionData
    @State private var isExpanded: Bool = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 0) {
                HStack() {
                    Text(section.title)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(Color.primary700)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.primary600)
                        .animation(.easeInOut(duration: 0.25), value: isExpanded)
                }
                .contentShape(Rectangle()) // makes whole header tappable
                .padding(.vertical, 8) // controls height of collapsed box
//                .padding(.horizontal, 20)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        isExpanded.toggle()
                    }
                }
                
                if isExpanded {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(parseLines(section.fullText), id: \.self) { line in
                            if line.hasPrefix("-") || extractNumberPrefix(line) != nil {
                                HStack(alignment: .top, spacing: 8) {
                                    if line.hasPrefix("-") {
                                        Text("•")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(Color.primary)
                                            .frame(alignment: .topLeading)
                                        
                                    } else if let numberPrefix = extractNumberPrefix(line) {
                                        Text("\(numberPrefix).")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(Color.primary)
                                            .frame(alignment: .topLeading)
                                        
                                    }
                                    Text(removePrefix(line))
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(4) // smoother spacing
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.leading, 4)
                            } else {
                                Text(line)
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(4)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding(.top, 12) // add 8pt space between title and expanded content
                    .transition(.opacity)
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.primary50)
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}

// Split content into lines
private func parseLines(_ text: String) -> [String] {
    text.components(separatedBy: "\n")
}

// Detect numbered prefix dynamically (1., 2., 3., ...)
private func extractNumberPrefix(_ line: String) -> Int? {
    let trimmed = line.trimmingCharacters(in: .whitespaces)
    let pattern = #"^(\d+)\."#
    if let regex = try? NSRegularExpression(pattern: pattern),
       let match = regex.firstMatch(in: trimmed, range: NSRange(trimmed.startIndex..., in: trimmed)) {
        if let range = Range(match.range(at: 1), in: trimmed) {
            return Int(trimmed[range])
        }
    }
    return nil
}

// Remove bullet or number prefix
private func removePrefix(_ line: String) -> String {
    var text = line.trimmingCharacters(in: .whitespaces)
    if text.hasPrefix("-") {
        text.removeFirst(1)
        text = text.trimmingCharacters(in: .whitespaces)
    } else if let _ = extractNumberPrefix(text) {
        if let dotIndex = text.firstIndex(of: ".") {
            text = String(text[text.index(after: dotIndex)...]).trimmingCharacters(in: .whitespaces)
        }
    }
    return text
}
