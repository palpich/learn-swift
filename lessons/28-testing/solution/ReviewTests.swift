import Testing
import CourseLib

@Test func palindromes() {
    #expect(isPalindrome("Radar"))
    #expect(!isPalindrome("Swift"))
    #expect(isPalindrome(""))
}

@Test(arguments: [
    (100, "excellent"),
    (75, "good"),
    (50, "satisfactory"),
    (0, "fail"),
    (101, "invalid score"),
])
func grades(score: Int, expected: String) {
    #expect(grade(score: score) == expected)
}

@Test func validAge() throws {
    #expect(try parseAge("30") == 30)
}

@Test func ageErrors() {
    #expect(throws: AgeError.notANumber("abc")) {
        try parseAge("abc")
    }
    #expect(throws: AgeError.outOfRange(200)) {
        try parseAge("200")
    }
}
