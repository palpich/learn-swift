// Lesson 26: SwiftUI — paste into an Xcode App project's ContentView.swift
// TODO: finish the todo list UI
import SwiftUI

// Review: lessons 12 and 14 (struct, protocol conformance)
struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    // TODO: var isDone = false
}

// Review: lesson 17 (extension)
extension String {
    // TODO: func trimmed() -> String
}

struct ContentView: View {
    // TODO: @State items: [TodoItem], draft

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Todo") // TODO: .font(.largeTitle)

            // TODO: TextField
            // TODO: Add + Clear buttons in HStack
            // TODO: Text("Left: N") — how many items are not done yet
            // TODO: List of items, a tap toggles isDone
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
