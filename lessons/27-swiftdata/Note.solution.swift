// Lesson 27: Note model solution
import Foundation
import SwiftData

@Model
final class Note {
    var text: String
    var createdAt: Date

    init(text: String, createdAt: Date = .now) {
        self.text = text
        self.createdAt = createdAt
    }
}
