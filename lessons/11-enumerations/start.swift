// Lesson 11: enumerations
// TODO: set correct rawValues and implement functions

enum Command: String {
    case forward = "?1"
    case back = "?2"
    case left = "?3"
    case right = "?4"
}

enum DownloadResult {
    case ok(bytes: Int)
    case fail(reason: String)
}

func code(_ command: Command) -> String {
    return ""
}

func fromCode(_ string: String) -> Command? {
    return nil
}

func describe(_ result: DownloadResult) -> String {
    return ""
}

// Review: lessons 05, 08, 10 (characters of a string, optionals, compactMap)
func parseCommands(_ text: String) -> [Command] {
    return []
}

// --- checks: no need to edit below this line ---
import Foundation

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

check("forward code", code(.forward), "F")
check("from code L", fromCode("L"), Command.left)
check("unknown code", fromCode("X"), nil)
check("ok", describe(.ok(bytes: 100)), "downloaded: 100 bytes")
check("fail", describe(.fail(reason: "timeout")), "error: timeout")
check("parse commands", parseCommands("FFLX"), [.forward, .forward, .left])
check("parse nothing", parseCommands("xyz"), [])
finish("Урок 11")
