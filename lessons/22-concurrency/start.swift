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

actor Scoreboard {
    private var value = 0
    func add(_ points: Int) {
        // TODO
    }
    func current() -> Int {
        return 0
    }
}

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
        fatalError("проверка не прошла")
    }
}

func runChecks() async {
    let sum = await delayedSum(2, 3)
    check("delayed sum", sum == 5)

    let labels = await parallelLabels()
    check("parallel", labels == ["A", "B"], "\(labels)")

    let board = Scoreboard()
    await board.add(4)
    await board.add(6)
    let score = await board.current()
    check("actor", score == 10)
    print("Урок 22 пройден!")
}

let sem = DispatchSemaphore(value: 0)
Task {
    await runChecks()
    sem.signal()
}
sem.wait()
