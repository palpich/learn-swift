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

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
        fatalError("проверка не прошла")
    }
}

let defaults = UserDefaults(suiteName: "learn.swift.lesson25")!
defaults.removePersistentDomain(forName: "learn.swift.lesson25")

saveUsername("Ada", to: defaults)
check("username", loadUsername(from: defaults) == "Ada")
check("default count", loadLaunchCount(from: defaults) == 0)
check("inc1", incrementLaunchCount(in: defaults) == 1)
check("inc2", incrementLaunchCount(in: defaults) == 2)
print("Урок 25 пройден!")
