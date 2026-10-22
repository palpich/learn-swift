// Project 04: notes
// TODO: struct, encode/decode, add/remove, stack for undo
import Foundation

struct Note {
    var id: Int
    var text: String
}

func encodeNotes(_ notes: [Note]) -> String {
    return ""
}

func decodeNotes(_ data: String) -> [Note] {
    return []
}

func add(text: String, to notes: [Note]) -> [Note] {
    return notes
}

func remove(id: Int, from notes: [Note]) -> [Note] {
    return notes
}

// Review: lesson 16 (generic Stack) — powers the undo command
struct Stack<Element> {
    private var items: [Element] = []

    var count: Int {
        return 0 // TODO
    }

    mutating func push(_ element: Element) {
        // TODO
    }

    mutating func pop() -> Element? {
        return nil // TODO
    }
}

// --- checks and game loop: no need to edit below this line ---
nonisolated(unsafe) var failures = 0

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        failures += 1
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
    }
}

func check<T: Equatable>(_ name: String, _ actual: T, _ expected: T) {
    check(name, actual == expected, "получили \(actual), ждали \(expected)")
}

func finish(_ title: String) {
    if failures == 0 {
        print("\(title) пройден!")
    } else {
        print("\(title): не прошло проверок — \(failures). Исправь код и запусти снова.")
        exit(1)
    }
}

func runChecks() {
    let a = [Note(id: 1, text: "first"), Note(id: 2, text: "second")]
    let s = encodeNotes(a)
    check("encode", s, "1|first\n2|second")
    let back = decodeNotes(s)
    check("count after decode", back.count, 2)
    check("second id", back.last?.id, 2)
    check("second text", back.last?.text, "second")

    let added = add(text: "new", to: a)
    check("new id", added.last?.id, 3)
    check("new text", added.last?.text, "new")
    check("id in empty", add(text: "solo", to: []).first?.id, 1)

    check("remove", remove(id: 1, from: a).map(\.id), [2])
    check("missing id", remove(id: 99, from: a).map(\.id), [1, 2])
    check("empty encode", encodeNotes([]), "")

    var history = Stack<[Note]>()
    history.push(a)
    history.push(added)
    check("history count", history.count, 2)
    check("undo returns last state", history.pop()?.count, 3)
    check("undo again", history.pop()?.count, 2)
    check("nothing to undo", history.pop()?.count, nil)
    finish("Проект 04")
}

func fileURL() -> URL {
    return URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        .appendingPathComponent("notes.txt")
}

func load() -> [Note] {
    let url = fileURL()
    guard let data = try? String(contentsOf: url, encoding: .utf8) else {
        return []
    }
    return decodeNotes(data)
}

func save(_ notes: [Note]) {
    let url = fileURL()
    try? encodeNotes(notes).write(to: url, atomically: true, encoding: .utf8)
}

func runGame() {
    var notes = load()
    var history = Stack<[Note]>()
    print("Notes. Commands: add … | list | remove N | undo | exit")
    print("File: \(fileURL().path)")

    while true {
        print(">", terminator: " ")
        guard let line = readLine() else { break }
        let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed == "exit" || trimmed == "выход" {
            save(notes)
            break
        }
        if trimmed == "list" {
            if notes.isEmpty {
                print("(empty)")
            } else {
                for n in notes {
                    print("[\(n.id)] \(n.text)")
                }
            }
            continue
        }
        if trimmed == "undo" {
            if let previous = history.pop() {
                notes = previous
                save(notes)
                print("Undone.")
            } else {
                print("Nothing to undo.")
            }
            continue
        }
        if trimmed.hasPrefix("add ") {
            let text = String(trimmed.dropFirst("add ".count))
            guard !text.isEmpty else {
                print("Need text after add.")
                continue
            }
            history.push(notes)
            notes = add(text: text, to: notes)
            save(notes)
            print("Added id=\(notes.last?.id ?? 0)")
            continue
        }
        if trimmed.hasPrefix("remove ") {
            let idString = String(trimmed.dropFirst("remove ".count))
            guard let id = Int(idString) else {
                print("Need a number: remove 1")
                continue
            }
            let updated = remove(id: id, from: notes)
            if updated.count < notes.count {
                history.push(notes)
                notes = updated
                save(notes)
                print("Removed.")
            } else {
                print("Not found.")
            }
            continue
        }
        print("Unknown command.")
    }
}

if CommandLine.arguments.contains("check") {
    runChecks()
} else {
    runGame()
}
