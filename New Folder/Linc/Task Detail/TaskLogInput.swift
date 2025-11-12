import SwiftUI

struct TaskLogInput: View {
    let label: String
    let unit: String
    var onSave: (() -> Void)? = nil

    @State private var value: String = ""
    @FocusState private var isFocused: Bool   // keyboard

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // MARK: - Input Field
            HStack(spacing: 12) {
                Text(label)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)

                Spacer(minLength: 8)

                HStack(spacing: 8) {
                    TextField("0.0", text: $value)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                        .font(.system(size: 20))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.trailing)
                    
                    Text(unit)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.primary400)
                }
                .padding(.horizontal, 12)
                .frame(width: 171, height: 48, alignment: .trailing)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.primary300, lineWidth: 0.5)
                )
            }

            // MARK: - Save Button
            Button(action: {
                isFocused = false
                onSave?()
            }) {
                Text("Done")
                    .font(.system(size: 17, weight: .semibold))
                    .frame(maxWidth: .infinity, minHeight: 48)
                    .background(value.isEmpty ? Color.primary200 : Color.primary700)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .animation(.easeInOut(duration: 0.2), value: value)
            }
            .disabled(value.isEmpty)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .background(Color.white)
        .overlay(
            Rectangle()
                .stroke(Color.primary200, lineWidth: 0.5)
        )
    }
}

#Preview {
    VStack(spacing: 0) {
        TaskLogInput(label: "Log today:", unit: "kg")
        Spacer()
    }
    .background(Color.primary50)
}
