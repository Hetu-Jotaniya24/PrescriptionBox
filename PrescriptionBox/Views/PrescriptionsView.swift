import SwiftUI

struct PrescriptionsView: View {
    @State private var prescriptionText: String = ""
    @State private var responseText: String = ""

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                TextField("Add Prescription", text: $prescriptionText)
                    .textFieldStyle(.roundedBorder)

                Button("Submit") {
                    // Simulate generating a response from the entered prescription text
                    let trimmed = prescriptionText.trimmingCharacters(in: .whitespacesAndNewlines)
                    if trimmed.isEmpty {
                        responseText = "Please enter a prescription first."
                    } else {
                        responseText = "Response for: \"\(trimmed)\"\n\nThis is where the structured prescription output would appear."
                    }
                }
                .buttonStyle(.borderedProminent)

                // Read-only text view to display the response
                TextEditor(text: $responseText)
                    .frame(minHeight: 140)
                    .disabled(true)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.quaternary, lineWidth: 1)
                    )

                Spacer()
            }
            .padding()
            .navigationTitle("Prescriptions")
        }
    }
}
