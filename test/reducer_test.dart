import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/redux/actions.dart';
import 'package:todo_app/redux/app_state.dart';
import 'package:todo_app/redux/reducers.dart';

main() {
  group('State Reducer', () {
    test('should add a new task to the allTask and incompleteTasks list', () {
      final String title = 'todo';
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(allTasks: [], incompleteTasks: []),
      );
      store.dispatch(AddTask(title));
      expect(store.state.allTasks[0].title, 'todo');
      expect(store.state.incompleteTasks[0].title, 'todo');
    });
    test('should check task to complete if task is incomplete', () {
      final Task task = Task(id: 1, title: 'task one', completed: false);
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(allTasks: [task]),
      );
      store.dispatch(CheckTask(task.id));
      expect(store.state.allTasks[0].completed, true);
    });

    test('should update completed list when check task', () {
      final Task task = Task(id: 1, title: 'incomplete task', completed: false);
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(
            allTasks: [task], completedTasks: [], incompleteTasks: [task]),
      );
      store.dispatch(CheckTask(task.id));
      expect(store.state.completedTasks.length, 1);
      expect(store.state.incompleteTasks.length, 0);
    });

    test('should update index of bottom bar', () {
      final int index = 2;
      final store = Store<AppState>(
        appStateReducer,
        initialState: AppState(index: 0),
      );
      store.dispatch(SwitchTab(index));
      expect(store.state.index, 2);
    });
  });
}
