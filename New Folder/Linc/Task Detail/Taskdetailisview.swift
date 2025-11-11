//
//  Taskdetailisview.swift
//  Linc
//
//  Created by JJ on 10/11/2025.
//
//
import SwiftUI

// --- Custom Button Style to match the purple "Save" button ---
struct SaveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
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
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.75 : 1.0)
        
    }
}
extension ButtonStyle where Self == SaveButtonStyle {
    static var saveButton: SaveButtonStyle { .init() }
}
// ---

struct Taskdetailisview: View {
    @StateObject var viewModel: TaskViewModel
    @Binding var isPresented: Bool // Used to dismiss the modal
    
    var body: some View {
        VStack(spacing: 10) {
            
            // Header (Task Details and Close Button)
            HStack {
                Text("Task Details")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Button { isPresented = false } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                }
            }
           .padding([.horizontal,.all])
//            .padding(.vertical, 16)
//            .padding(.horizontal, 16)
        
            Divider()
                .frame(height: 2)
                .background(Color(.systemGray3))     // darker colour

            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    TaskInfoBlock(task: viewModel.task)
                    
                    if let warning = viewModel.task.warningThreshold {
                        WarningBlock(warningThreshold: warning)
                    }
                    
                    LogInputBlock(loggedValue: $viewModel.loggedValue, unit: viewModel.task.unit)
                    
                    Spacer()
                }
                .padding()
            }
            
            // Save Button
            Button("Save") {
                // In a real app, you would send viewModel.loggedValue to your server
                print("Saving value: \(viewModel.loggedValue) \(viewModel.task.unit)")
                isPresented = false
            }
            .buttonStyle(.saveButton)
            .padding([.horizontal, .bottom])
        }
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .padding(.vertical, 120)
        .padding(.horizontal, 20)
        
    }
}

// --- Sub-View 1: The Weight Check Block ---
struct TaskInfoBlock: View {
    let task: HealthTask

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            // TITLE + ICON
            HStack(alignment: .center) {
                Text(task.title)                 // "Check Morning Weight"
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(Color(.label))

                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color(red: 0.85, green: 0.85, blue: 1.0))
                    Image(systemName: "scalemass")  // weight icon
                        .font(.system(size: 23))
                        .foregroundColor(
                            Color(red: 0.63, green: 0.63, blue: 0.93)
                        )
                }
                .frame(width: 40, height: 40)
            }

            // TIME PILL: "8:15 AM • Before breakfast."
            HStack(spacing: 6) {
                Text(task.time)                    // "8:15 AM"
                Text("•")
                Text(task.instruction)             // "Before breakfast."
            }
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(Color(red: 0.43, green: 0.45, blue: 0.57))
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color(red: 0.93, green: 0.94, blue: 1.0))  // light purple pill
            )

            // DESCRIPTION TEXT (NOT RED ANYMORE)
            Text(task.context)
                .font(.system(size: 15))
                .foregroundColor(Color(red: 0.21, green: 0.24, blue: 0.34)) // dark grey
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(red: 0.98, green: 0.97, blue: 1.0))          // very pale purple block
        )
    }
}


// --- Sub-View 2: The Call Doctor Warning Block ---
struct WarningBlock: View {
    let warningThreshold: String   // e.g. "+2 kg in 2 days"

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "phone.fill")
                .foregroundColor(.red)

            Text("Call doctor if \(warningThreshold).")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.red)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color(red: 1.0, green: 0.93, blue: 0.93)) // soft pink like left
        )
        
        Divider()
            .frame(height: 2)
            .background(Color(.systemGray3))
            .padding(.horizontal, -24)
    }
}


// --- Sub-View 3: The Log Input ---
struct LogInputBlock: View {
    @Binding var loggedValue: String
    let unit: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Label
            Text("Log today:")
                .foregroundColor(.black)
                .fontWeight(.bold)
            
            // Input row inside one rounded box
            HStack {
                TextField("", text: $loggedValue)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.leading)
                
                Spacer(minLength: 6)
                
                Text(unit)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.35),
                            radius: 3, x: 0, y: 1)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 13, style: .continuous)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
        }
    }
}


#Preview {
    // Create state variables needed for the view
    @Previewable @State var isShowing: Bool = true
        
    // Create the required view model
    let viewModel = TaskViewModel(task: exampleWeightTask)
        
    // Instantiate the view with all required properties
    return Taskdetailisview(
        viewModel: viewModel,
        isPresented: $isShowing
    )
    .background(Color.black.opacity(0.35))
    
    
}
