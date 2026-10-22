import Testing
import CourseLib

@Test func clampMiddle() {
    #expect(clamp(5, min: 0, max: 10) == 5)
}

@Test func clampLow() {
    #expect(clamp(-3, min: 0, max: 10) == 0)
}

@Test func clampHigh() {
    #expect(clamp(99, min: 0, max: 10) == 10)
}

@Test func averageEmpty() {
    #expect(average([]) == nil)
}

@Test func averageValues() {
    #expect(average([2, 4]) == 3)
}
