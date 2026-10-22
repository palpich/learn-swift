// Lesson 25: UserDefaults
// TODO
import Foundation

func saveUsername(_ name: String, to defaults: UserDefaults) {
}

func loadUsername(from defaults: UserDefaults) -> String? {
    return nil
}

func saveLaunchCount(_ count: Int, to defaults: UserDefaults) {
}

func loadLaunchCount(from defaults: UserDefaults) -> Int {
    return -1
}

func incrementLaunchCount(in defaults: UserDefaults) -> Int {
    return 0
}

// Review: lessons 08 and 21 (fallback value, Codable)
struct Settings: Codable, Equatable {
    var theme: String
    var fontSize: Int
}

let defaultSettings = Settings(theme: "light", fontSize: 14)

func saveSettings(_ settings: Settings, to defaults: UserDefaults) {
}

func loadSettings(from defaults: UserDefaults) -> Settings {
    return Settings(theme: "", fontSize: 0)
}

// --- checks: no need to edit below this line ---
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

let defaults = UserDefaults(suiteName: "learn.swift.lesson25")!
defaults.removePersistentDomain(forName: "learn.swift.lesson25")

saveUsername("Ada", to: defaults)
check("username", loadUsername(from: defaults), "Ada")
check("default count", loadLaunchCount(from: defaults), 0)
check("inc1", incrementLaunchCount(in: defaults), 1)
check("inc2", incrementLaunchCount(in: defaults), 2)

check("default settings", loadSettings(from: defaults), defaultSettings)
let dark = Settings(theme: "dark", fontSize: 18)
saveSettings(dark, to: defaults)
check("saved settings", loadSettings(from: defaults), dark)
finish("Урок 25")
