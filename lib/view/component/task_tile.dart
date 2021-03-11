import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/redux/actions.dart';
import 'package:todo_app/view/home.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  TaskTile({this.task});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Checkbox(
            value: task.completed,
            onChanged: (_) {
              store.dispatch(CheckTask(task.id));
            },
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              task.title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
