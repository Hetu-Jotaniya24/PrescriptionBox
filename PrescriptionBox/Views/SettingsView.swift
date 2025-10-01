import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        NavigationStack {
            Form {
                TextField("Username", text: $userSettings.username)
                TextField("Enter Your API Key", text: $userSettings.cred)

                Section("API Configuration") {
                    Text("Placeholder for API Config")
                        .foregroundColor(.secondary)
                }
                
                Section("App Settings") {
                    Text("Placeholder for App Settings")
                        .foregroundColor(.secondary)
                }
                
                Section("About") {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

