import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let isCompleted: Bool
}

let tasks = [
    Task(
        title: "Plan Weekly Meeting",
        description: "Prepare the agenda and talking points for the upcoming team meeting, and share the document with all participants.",
        isCompleted: false
    ),
    Task(
        title: "Buy Groceries",
        description: "Pick up vegetables, fruits, and other essentials from the supermarket for the week.",
        isCompleted: false
    ),
    Task(
        title: "Finish SwiftUI Tutorial",
        description: "Complete the SwiftUI basics tutorial to understand views, modifiers, and layout system.",
        isCompleted: true
    ),
    Task(
        title: "Walk the Dog",
        description: "Take Bruno out for a 30-minute walk in the park to get some exercise.",
        isCompleted: false
    ),
    Task(
        title: "Respond to Client Emails",
        description: "Reply to all pending client emails regarding project updates and feedback.",
        isCompleted: true
    )
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(tasks) { task in
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                        Text(task.title)
                            .font(.headline)
                    }
                    Text(task.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Task Manager")
        }
    }
}

#Preview {
    ContentView()
}
