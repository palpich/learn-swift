// Project 04: notes
// TODO: struct, encode/decode, add/remove
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

func check(_ name: String, _ actual: Any, _ expected: Any) {
    let a = "\(actual)"
    let e = "\(expected)"
    if a == e {
        print("✓ \(name)")
    } else {
        print("✗ \(name): получили \(a), ждали \(e)")
        fatalError("проверка не прошла")
    }
}

func runChecks() {
    let a = [Note(id: 1, text: "first"), Note(id: 2, text: "second")]
    let s = encodeNotes(a)
    check("encode", s, "1|first\n2|second")
    let back = decodeNotes(s)
    check("count after decode", back.count, 2)
    check("second id", back[1].id, 2)
    check("second text", back[1].text, "second")

    let added = add(text: "new", to: a)
    if added.last?.id == 3 { print("✓ new id") } else { fatalError("new id") }
    if added.last?.text == "new" { print("✓ new text") } else { fatalError("new text") }

    let emptyAdd = add(text: "solo", to: [])
    if emptyAdd.first?.id == 1 { print("✓ id in empty") } else { fatalError("id in empty") }

    let afterDel = remove(id: 1, from: a)
    check("remove", afterDel.map(\.id), [2])
    check("missing id", remove(id: 99, from: a).map(\.id), [1, 2])
    check("empty encode", encodeNotes([]), "")
    print("Project 04: checks passed!")
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
    print("Notes. Commands: add … | list | remove N | exit")
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
        if trimmed.hasPrefix("add ") {
            let text = String(trimmed.dropFirst("add ".count))
            guard !text.isEmpty else {
                print("Need text after add.")
                continue
            }
            notes = add(text: text, to: notes)
            save(notes)
            print("Added id=\(notes.last!.id)")
            continue
        }
        if trimmed.hasPrefix("remove ") {
            let idString = String(trimmed.dropFirst("remove ".count))
            guard let id = Int(idString) else {
                print("Need a number: remove 1")
                continue
            }
            let before = notes.count
            notes = remove(id: id, from: notes)
            save(notes)
            print(notes.count < before ? "Removed." : "Not found.")
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
