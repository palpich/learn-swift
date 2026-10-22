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
