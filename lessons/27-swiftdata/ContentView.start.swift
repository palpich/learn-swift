// Lesson 27: ContentView — TODO paste into Xcode
import SwiftUI
import SwiftData

struct ContentView: View {
    // TODO: @Environment(\.modelContext)
    // TODO: @Query(sort: \Note.createdAt, order: .reverse) notes
    @State private var draft = ""

    var body: some View {
        NavigationStack {
            VStack {
                // TODO: TextField + Add button
                // TODO: List of notes with delete
            }
            .navigationTitle("Notes")
            .padding()
        }
    }
}
