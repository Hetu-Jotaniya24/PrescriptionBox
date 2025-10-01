import SwiftUI
import Combine

@MainActor
final class UserSettings: ObservableObject {
    // Persisted storage using AppStorage (no direct UserDefaults usage)
    @AppStorage("username") private var storedUsername: String = ""
    @AppStorage("cred") private var storedCred: String = ""

    // Public API exposed as computed properties so we can notify observers
    var username: String {
        get { storedUsername }
        set {
            objectWillChange.send()
            storedUsername = newValue
        }
    }

    var cred: String {
        get { storedCred }
        set {
            objectWillChange.send()
            storedCred = newValue
        }
    }
}
