// Lesson 26: solution — paste into ContentView.swift
import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isDone = false
}

extension String {
    func trimmed() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

struct ContentView: View {
    @State private var items: [TodoItem] = [
        TodoItem(title: "Learn Swift"),
        TodoItem(title: "Build UI"),
    ]
    @State private var draft = ""

    private var leftCount: Int {
        items.filter { !$0.isDone }.count
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Todo")
                .font(.largeTitle)

            TextField("New item", text: $draft)
                .textFieldStyle(.roundedBorder)

            HStack {
                Button("Add") {
                    let text = draft.trimmed()
                    guard !text.isEmpty else { return }
                    items.append(TodoItem(title: text))
                    draft = ""
                }
                Button("Clear") {
                    items.removeAll()
                }
            }

            Text("Left: \(leftCount)")
                .foregroundStyle(.secondary)

            List(items) { item in
                Button {
                    toggle(item)
                } label: {
                    HStack {
                        Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                        Text(item.title)
                            .strikethrough(item.isDone)
                    }
                }
            }
        }
        .padding()
    }

    private func toggle(_ item: TodoItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index].isDone.toggle()
    }
}

#Preview {
    ContentView()
}
