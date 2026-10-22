// Lesson 27: ContentView solution
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Note.createdAt, order: .reverse) private var notes: [Note]
    @State private var draft = ""
    @State private var search = ""

    private var visibleNotes: [Note] {
        if search.isEmpty {
            return notes
        }
        return notes.filter { $0.text.lowercased().contains(search.lowercased()) }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                HStack {
                    TextField("New note", text: $draft)
                        .textFieldStyle(.roundedBorder)
                    Button("Add") {
                        let text = draft.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !text.isEmpty else { return }
                        modelContext.insert(Note(text: text))
                        draft = ""
                    }
                }

                List {
                    ForEach(visibleNotes) { note in
                        VStack(alignment: .leading) {
                            Text(note.text)
                            Text(note.createdAt.formatted())
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            modelContext.delete(visibleNotes[index])
                        }
                    }
                }
            }
            .navigationTitle("Notes")
            .searchable(text: $search)
            .padding()
        }
    }
}
