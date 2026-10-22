// Project 02: hangman
// TODO: mask and afterGuess

func mask(word: String, guessed: Set<Character>) -> String {
    return ""
}

func afterGuess(
    word: String,
    letter: Character,
    guessed: Set<Character>,
    misses: Set<Character>,
    lives: Int
) -> (guessed: Set<Character>, misses: Set<Character>, lives: Int, status: String) {
    return (guessed, misses, lives, "ok")
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
    check("mask all hidden", mask(word: "cat", guessed: []), "_ _ _")
    check("mask partial", mask(word: "cat", guessed: ["c"]), "c _ _")

    var r = afterGuess(word: "cat", letter: "a", guessed: [], misses: [], lives: 3)
    check("hit status", r.status, "ok")
    check("hit set", r.guessed.contains("a"), true)

    r = afterGuess(word: "cat", letter: "a", guessed: ["a"], misses: [], lives: 3)
    check("repeat", r.status, "repeat")

    r = afterGuess(word: "cat", letter: "z", guessed: [], misses: [], lives: 1)
    check("lose", r.status, "lose")
    check("lives 0", r.lives, 0)

    r = afterGuess(word: "hi", letter: "h", guessed: ["i"], misses: [], lives: 3)
    check("win", r.status, "win")

    print("Project 02: checks passed!")
}

func runGame() {
    let words = ["swift", "array", "function", "optional"]
    let word = words.randomElement()!.lowercased()
    var guessed = Set<Character>()
    var misses = Set<Character>()
    var lives = 6

    print("Hangman. Word length \(word.count). Lives: \(lives)")

    while true {
        print(mask(word: word, guessed: guessed))
        print("Misses: \(misses.sorted()) | lives: \(lives)")
        print("Letter:", terminator: " ")
        guard let line = readLine(), let letter = line.lowercased().first, line.count == 1 else {
            print("Enter one letter.")
            continue
        }

        let r = afterGuess(word: word, letter: letter, guessed: guessed, misses: misses, lives: lives)
        guessed = r.guessed
        misses = r.misses
        lives = r.lives

        switch r.status {
        case "repeat":
            print("Already tried that letter.")
        case "win":
            print(mask(word: word, guessed: guessed))
            print("You win! Word: \(word)")
            return
        case "lose":
            print("You lose. The word was: \(word)")
            return
        case "miss":
            print("No such letter.")
        default:
            break
        }
    }
}

if CommandLine.arguments.contains("check") {
    runChecks()
} else {
    runGame()
}
