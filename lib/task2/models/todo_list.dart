import 'task.dart';

class TodoList {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(String title) {
    tasks.removeWhere((task) => task.title == title);
  }

  void changeTaskStatus(String title, bool isCompleted) {
    tasks.firstWhere((task) => task.title == title).isCompleted = isCompleted;
  }

  List<Task> getCompletedTasks() {
    return tasks.where((task) => task.isCompleted).toList();
  }

  List<Task> getOutstandingTasks() {
    return tasks.where((task) => !task.isCompleted).toList();
  }

  void clearCompletedTasks() {
    tasks.removeWhere((task) => task.isCompleted);
  }
}
