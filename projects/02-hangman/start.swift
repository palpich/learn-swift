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

    finish("Проект 02")
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
