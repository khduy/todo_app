import 'package:todo_app/model/task.dart';
import 'package:todo_app/redux/actions.dart';
import 'package:todo_app/redux/app_state.dart';

AppState appStateReducer(AppState prevState, dynamic action) {
  AppState newState;

  newState = prevState.copyWith(
      allTasks: taskReducer(prevState.allTasks, action),
      index: indexReducer(prevState.index, action));

  newState = newState.copyWith(
    completedTasks: completedTaskReducer(
        newState.completedTasks, newState.allTasks, action),
    incompleteTasks: incompleteTaskReducer(
        newState.incompleteTasks, newState.allTasks, action),
  );

  return newState;
}

List<Task> taskReducer(List<Task> allTasks, action) {
  if (action is AddTask) {
    return <Task>[]
      ..addAll(allTasks)
      ..add(Task(id: action.id, title: action.title));
  } else if (action is CheckTask) {
    return allTasks
        .map((Task task) => task.id == action.id
            ? task.copyWith(completed: !task.completed)
            : task)
        .toList();
  }
  return allTasks;
}

List<Task> completedTaskReducer(
    List<Task> completedTasks, List<Task> allTasks, action) {
  if (action is CheckTask) {
    List<Task> temp = [];
    allTasks.forEach((t) {
      if (t.completed == true) temp.add(t);
    });
    completedTasks = temp;
  }
  return completedTasks;
}

List<Task> incompleteTaskReducer(
    List<Task> incompleteTasks, List<Task> allTasks, action) {
  if (action is AddTask) {
    return <Task>[]
      ..addAll(incompleteTasks)
      ..add(Task(id: action.id, title: action.title)); // chua duoc.
  } else if (action is CheckTask) {
    List<Task> temp = [];
    allTasks.forEach((t) {
      if (t.completed == false) temp.add(t);
    });
    incompleteTasks = temp;
  }

  return incompleteTasks;
}

int indexReducer(int index, action) {
  if (action is SwitchTab) {
    index = action.index;
  }
  return index;
}
