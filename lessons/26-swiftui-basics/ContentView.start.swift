// Lesson 26: SwiftUI — paste into an Xcode App project's ContentView.swift
// TODO: finish the todo list UI
import SwiftUI

struct ContentView: View {
    // TODO: @State items, draft

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Todo") // TODO: .font(.largeTitle)

            // TODO: TextField
            // TODO: Add + Clear buttons in HStack
            // TODO: List of items
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
