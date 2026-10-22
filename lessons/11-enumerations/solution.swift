// Lesson 11: solution

enum Command: String {
    case forward = "F"
    case back = "B"
    case left = "L"
    case right = "R"
}

enum DownloadResult {
    case ok(bytes: Int)
    case fail(reason: String)
}

func code(_ command: Command) -> String {
    return command.rawValue
}

func fromCode(_ string: String) -> Command? {
    return Command(rawValue: string)
}

func describe(_ result: DownloadResult) -> String {
    switch result {
    case .ok(let bytes):
        return "downloaded: \(bytes) bytes"
    case .fail(let reason):
        return "error: \(reason)"
    }
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
