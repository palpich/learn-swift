// Lesson 27: ContentView — TODO paste into Xcode
import SwiftUI
import SwiftData

struct ContentView: View {
    // TODO: @Environment(\.modelContext)
    // TODO: @Query(sort: \Note.createdAt, order: .reverse) notes
    @State private var draft = ""
    @State private var search = ""

    // Review: lessons 03 and 10 (lowercased + contains, filter)
    // TODO: var visibleNotes: [Note] — all notes if search is empty,
    //       otherwise only notes whose text contains search (case-insensitive)

    var body: some View {
        NavigationStack {
            VStack {
                // TODO: TextField + Add button
                // TODO: List of visibleNotes with delete
            }
            .navigationTitle("Notes")
            .searchable(text: $search)
            .padding()
        }
    }
}
