// Project 01: solution

func hint(secret: Int, guess: Int) -> String {
    if guess == secret {
        return "correct"
    } else if guess > secret {
        return "lower"
    } else {
        return "higher"
    }
}

func gameOver(livesLeft: Int, lastHint: String) -> String? {
    if lastHint == "correct" {
        return "correct"
    }
    if livesLeft == 0 {
        return "lose"
    }
    return nil
}

// --- checks and game loop: no need to edit below this line ---
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

func runChecks() {
    check("correct", hint(secret: 50, guess: 50), "correct")
    check("lower", hint(secret: 50, guess: 60), "lower")
    check("higher", hint(secret: 50, guess: 40), "higher")
    check("end correct", gameOver(livesLeft: 3, lastHint: "correct"), "correct")
    check("end lose", gameOver(livesLeft: 0, lastHint: "higher"), "lose")
    check("continue", gameOver(livesLeft: 2, lastHint: "lower"), nil)
    finish("Проект 01")
}

func runGame() {
    let maximum = 100
    let secret = Int.random(in: 1...maximum)
    var lives = 7

    print("I picked a number from 1 to \(maximum). You have \(lives) tries.")

    while true {
        print("Enter a number:", terminator: " ")
        guard let line = readLine(), let guess = Int(line) else {
            print("Need an integer.")
            continue
        }

        let tip = hint(secret: secret, guess: guess)
        if tip != "correct" {
            lives -= 1
            print("My number is \(tip). Tries left: \(lives)")
        } else {
            print("Correct!")
        }

        if let result = gameOver(livesLeft: lives, lastHint: tip) {
            if result == "lose" {
                print("Out of tries. It was \(secret).")
            }
            break
        }
    }
}

if CommandLine.arguments.contains("check") {
    runChecks()
} else {
    runGame()
}
