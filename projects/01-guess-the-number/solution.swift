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

func runChecks() {
    check("correct", hint(secret: 50, guess: 50), "correct")
    check("lower", hint(secret: 50, guess: 60), "lower")
    check("higher", hint(secret: 50, guess: 40), "higher")

    if gameOver(livesLeft: 3, lastHint: "correct") == "correct" {
        print("✓ end correct")
    } else {
        fatalError("end correct")
    }
    if gameOver(livesLeft: 0, lastHint: "higher") == "lose" {
        print("✓ end lose")
    } else {
        fatalError("end lose")
    }
    if gameOver(livesLeft: 2, lastHint: "lower") == nil {
        print("✓ continue")
    } else {
        fatalError("continue")
    }
    print("Project 01: checks passed!")
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
