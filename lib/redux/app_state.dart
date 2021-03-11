import 'package:todo_app/model/task.dart';

class AppState {
  final List<Task> allTasks;
  final List<Task> completedTasks;
  final List<Task> incompleteTasks;
  final int index;

  AppState(
      {this.allTasks, this.completedTasks, this.incompleteTasks, this.index});

  AppState copyWith(
      {List<Task> allTasks,
      List<Task> completedTasks,
      List<Task> incompleteTasks,
      int index}) {
    return AppState(
      allTasks: allTasks ?? this.allTasks,
      completedTasks: completedTasks ?? this.completedTasks,
      incompleteTasks: incompleteTasks ?? this.incompleteTasks,
      index: index ?? this.index,
    );
  }
}
