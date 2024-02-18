import 'package:flutter/material.dart';
import 'models/task.dart';
import 'models/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TodoList todoList = TodoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Task newTask = Task(title: "Task ${todoList.tasks.length + 1}", description: "Description for Task");
                setState(() {
                  todoList.addTask(newTask);
                });
              },
              child: Text("Add Task"),
            ),
            SizedBox(height: 16),
            Text("All Tasks:"),
            for (Task task in todoList.tasks)
              TaskTile(
                task: task,
                onCheckboxChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      task.isCompleted = value;
                    });
                  }
                },
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  todoList.clearCompletedTasks();
                });
              },
              child: Text("Clear Completed Tasks"),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onCheckboxChanged;

  TaskTile({required this.task, required this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: onCheckboxChanged,
      ),
    );
  }
}


