// Lesson 26: solution — paste into ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var items: [String] = ["Learn Swift", "Build UI"]
    @State private var draft = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Todo")
                .font(.largeTitle)

            TextField("New item", text: $draft)
                .textFieldStyle(.roundedBorder)

            HStack {
                Button("Add") {
                    let text = draft.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !text.isEmpty else { return }
                    items.append(text)
                    draft = ""
                }
                Button("Clear") {
                    items.removeAll()
                }
            }

            List(items, id: \.self) { item in
                Text(item)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
