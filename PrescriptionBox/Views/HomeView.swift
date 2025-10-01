import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Prescription Box")
                    .font(.title)
                    .padding()
                if !userSettings.username.isEmpty {
                    Text("Hello, \(userSettings.username)!")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.top, 4)
                }
                
                Spacer()
            }
            .navigationTitle("Home")
        }
    }
}
