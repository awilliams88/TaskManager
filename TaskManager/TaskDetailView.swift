import SwiftUI

struct TaskDetailView: View {
    let task: Task
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(task.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(task.description)
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Task Detail")
    }
}

#Preview {
    TaskDetailView(task: Task(title: "Sample Task", description: "This is a sample task description.", isCompleted: false))
}
