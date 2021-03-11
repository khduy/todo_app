import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:todo_app/redux/actions.dart';
import 'package:todo_app/redux/app_state.dart';

import 'package:todo_app/view/component/task_tile.dart';
import 'package:todo_app/view/home.dart';

class AllTask extends StatefulWidget {
  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_textEditingController.text.trim().isNotEmpty) {
                    store.dispatch(AddTask(_textEditingController.text.trim()));
                  }
                },
                child: Text('Add'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, state) => ListView.separated(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: store.state.allTasks.length,
              itemBuilder: (context, index) {
                return TaskTile(task: store.state.allTasks[index]);
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
