import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app/redux/actions.dart';
import 'package:todo_app/redux/app_state.dart';
import 'package:todo_app/redux/reducers.dart';
import 'package:todo_app/view/all_task.dart';
import 'package:todo_app/view/completed.dart';
import 'package:todo_app/view/incomplete.dart';

final store = Store<AppState>(
  appStateReducer,
  initialState:
      AppState(allTasks: [], completedTasks: [], incompleteTasks: [], index: 0),
);

class Home extends StatelessWidget {
  final List<Widget> _widgetOptions = <Widget>[
    AllTask(),
    Completed(),
    Incomplete(),
  ];

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Todo list"),
        ),
        body: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: _widgetOptions.elementAt(store.state.index),
          ),
        ),
        bottomNavigationBar: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) => BottomNavigationBar(
            currentIndex: store.state.index,
            items: [
              BottomNavigationBarItem(
                label: "All task",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Completed",
                icon: Icon(Icons.done),
              ),
              BottomNavigationBarItem(
                label: "Incomplete",
                icon: Icon(Icons.clear),
              ),
            ],
            onTap: (index) {
              store.dispatch(SwitchTab(index));
            },
          ),
        ),
      ),
    );
  }
}
