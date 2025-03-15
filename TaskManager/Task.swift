import Foundation
import SwiftData

@Model
class Task {
    var title: String
    var taskDescription: String
    var isCompleted: Bool

    init(title: String, taskDescription: String, isCompleted: Bool = false) {
        self.title = title
        self.taskDescription = taskDescription
        self.isCompleted = isCompleted
    }
}

