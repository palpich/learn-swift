import Testing
import CourseLib

// Review: lesson 03
@Test func palindromes() {
    #expect(isPalindrome("Radar"))
    // TODO: expect "Swift" is not a palindrome and "" is a palindrome
    #expect(Bool(false))
}

// Review: lesson 04 — one test, many inputs
// TODO: replace every "TODO" with the grade from lesson 04
@Test(arguments: [
    (100, "excellent"),
    (75, "good"),
    (50, "TODO"),
    (0, "TODO"),
    (101, "TODO"),
])
func grades(score: Int, expected: String) {
    #expect(grade(score: score) == expected)
}

// Review: lesson 15
@Test func validAge() throws {
    #expect(try parseAge("30") == 30)
}

@Test func ageErrors() {
    #expect(throws: AgeError.notANumber("abc")) {
        try parseAge("abc")
    }
    // TODO: expect parseAge("200") throws AgeError.outOfRange(200)
    #expect(Bool(false))
}
