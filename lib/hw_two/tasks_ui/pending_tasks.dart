import 'package:flutter/material.dart';

import '../gloable_data.dart';
import '../task.dart';
class PendingTasks extends StatefulWidget {
  final Tasks task;

  const PendingTasks({Key key, this.task}) : super(key: key);

  @override
  _PendingTasksState createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange.withOpacity(0.4),
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: !widget.task.isDone
          ? ListTile(
        leading: Icon(Icons.pending),
        subtitle: Text("${widget.task.subTitle}"),
        title: Text("${widget.task.title}"),
        trailing: Checkbox(
          value: widget.task.isDone,
          onChanged: (value) {
            widget.task.isDone = value;
            tasks[widget.task.id].isDone = value;
            setState(() {});
          },
        ),
      )
          : null,
    );
  }
}