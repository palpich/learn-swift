// Lesson 22: concurrency
// TODO
import Foundation

func delayedSum(_ a: Int, _ b: Int) async -> Int {
    return 0
}

func labelA() async -> String { "A" }
func labelB() async -> String { "B" }

func parallelLabels() async -> [String] {
    return []
}

// Review: lessons 07, 08, 10 (dictionary, optional, reduce / max)
actor Scoreboard {
    private var scores: [String: Int] = [:]

    func add(_ points: Int, for player: String) {
        // TODO
    }

    func total() -> Int {
        return 0 // TODO
    }

    func leader() -> String? {
        return nil // TODO
    }
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

func runChecks() async {
    check("delayed sum", await delayedSum(2, 3), 5)
    check("parallel", await parallelLabels(), ["A", "B"])

    let board = Scoreboard()
    await board.add(4, for: "Anya")
    await board.add(6, for: "Boris")
    await board.add(3, for: "Anya")
    check("total", await board.total(), 13)
    check("leader", await board.leader(), "Anya")
    check("no leader yet", await Scoreboard().leader(), nil)
    finish("Урок 22")
}

let sem = DispatchSemaphore(value: 0)
Task {
    await runChecks()
    sem.signal()
}
sem.wait()
