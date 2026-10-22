// Lesson 22: solution
import Foundation

func delayedSum(_ a: Int, _ b: Int) async -> Int {
    try? await Task.sleep(nanoseconds: 10_000_000)
    return a + b
}

func labelA() async -> String { "A" }
func labelB() async -> String { "B" }

func parallelLabels() async -> [String] {
    async let a = labelA()
    async let b = labelB()
    return await [a, b]
}

actor Scoreboard {
    private var value = 0
    func add(_ points: Int) {
        value += points
    }
    func current() -> Int {
        return value
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
