// Lesson 27: App entry — replace your @main App body accordingly
import SwiftUI
import SwiftData

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self)
    }
}
