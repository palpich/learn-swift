// Lesson 11: enumerations
// TODO: set correct rawValues and implement functions

enum Command: String {
    case forward = "?"
    case back = "?"
    case left = "?"
    case right = "?"
}

enum DownloadResult {
    case ok(bytes: Int)
    case fail(reason: String)
}

func code(_ command: Command) -> String {
    return command.rawValue
}

func fromCode(_ string: String) -> Command? {
    return nil
}

func describe(_ result: DownloadResult) -> String {
    return ""
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

check("forward code", code(.forward), "F")
if fromCode("L") == .left { print("✓ from code L") } else { fatalError("from code L") }
if fromCode("X") == nil { print("✓ unknown code") } else { fatalError("unknown code") }
check("ok", describe(.ok(bytes: 100)), "downloaded: 100 bytes")
check("fail", describe(.fail(reason: "timeout")), "error: timeout")
print("Урок 11 пройден!")
