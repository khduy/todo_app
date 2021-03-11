import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/redux/app_state.dart';

import 'package:todo_app/view/component/task_tile.dart';
import 'package:todo_app/view/home.dart';

class Incomplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: store.state.incompleteTasks.length,
          itemBuilder: (context, index) => TaskTile(
            task: store.state.incompleteTasks[index],
          ),
          separatorBuilder: (context, index) => SizedBox(height: 5),
        ),
      ),
    );
  }
}
