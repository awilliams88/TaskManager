import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var tasks: [Task]
    @State private var searchText = ""
    
    var filteredTasks: [Task] {
        if searchText.isEmpty {
            return tasks
        } else {
            return tasks.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredTasks) { task in
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompleted ? .green : .gray)
                                Text(task.title)
                                    .font(.headline)
                            }
                            Text(task.taskDescription)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Toggle("Completed", isOn: Binding(
                                get: { task.isCompleted },
                                set: { newValue in
                                    task.isCompleted = newValue
                                    try? context.save()
                                }
                            ))
                            .toggleStyle(SwitchToggleStyle())
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Task Manager")
            .searchable(text: $searchText, prompt: "Search tasks")
            .toolbar {
                Button(action: addSampleTask) {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    private func addSampleTask() {
        let newTask = Task(title: "New Task", taskDescription: "New Description")
        context.insert(newTask)
        try? context.save()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}

