// Lesson 25: solution
import Foundation

func saveUsername(_ name: String, to defaults: UserDefaults) {
    defaults.set(name, forKey: "username")
}

func loadUsername(from defaults: UserDefaults) -> String? {
    defaults.string(forKey: "username")
}

func saveLaunchCount(_ count: Int, to defaults: UserDefaults) {
    defaults.set(count, forKey: "launchCount")
}

func loadLaunchCount(from defaults: UserDefaults) -> Int {
    defaults.object(forKey: "launchCount") == nil ? 0 : defaults.integer(forKey: "launchCount")
}

func incrementLaunchCount(in defaults: UserDefaults) -> Int {
    let next = loadLaunchCount(from: defaults) + 1
    saveLaunchCount(next, to: defaults)
    return next
}

struct Settings: Codable, Equatable {
    var theme: String
    var fontSize: Int
}

let defaultSettings = Settings(theme: "light", fontSize: 14)

func saveSettings(_ settings: Settings, to defaults: UserDefaults) {
    if let data = try? JSONEncoder().encode(settings) {
        defaults.set(data, forKey: "settings")
    }
}

func loadSettings(from defaults: UserDefaults) -> Settings {
    guard let data = defaults.data(forKey: "settings") else {
        return defaultSettings
    }
    return (try? JSONDecoder().decode(Settings.self, from: data)) ?? defaultSettings
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
