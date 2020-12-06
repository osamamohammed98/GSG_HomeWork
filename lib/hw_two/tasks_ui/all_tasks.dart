import 'package:flutter/material.dart';

import '../gloable_data.dart';
import '../task.dart';

class AllTasks extends StatefulWidget {
  final Tasks task;

  const AllTasks({Key key, this.task}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: widget.task.isDone
          ? Colors.green.withOpacity(0.4)
          : Colors.blue.withOpacity(0.4),
      elevation: 10,
      child: ListTile(
        leading: widget.task.isDone ? Icon(Icons.done_all) : Icon(Icons.notes),
        title: Text("${widget.task.title}"),
        subtitle: Text("${widget.task.subTitle}"),
        trailing: Checkbox(
          value: widget.task.isDone,
          onChanged: (value) {
            widget.task.isDone = value;
            tasks[widget.task.id].isDone = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}