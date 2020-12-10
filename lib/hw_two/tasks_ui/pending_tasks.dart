import 'package:flutter/material.dart';

import '../gloable_data.dart';
import '../task.dart';

class PendingTasks extends StatefulWidget {
  final Tasks task;
  final Function fun;

  const PendingTasks({Key key, this.task, this.fun}) : super(key: key);

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
              onTap: () {},
              leading: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                   // tasks.removeAt(tasks.indexOf(widget.task));
                    //widget.fun(widget.task);
                    widget.fun(context , widget.task);
                  });
                },
              ),
              subtitle: Text("${widget.task.subTitle}"),
              title: Text("${widget.task.title}"),
              trailing: Checkbox(
                value: widget.task.isDone,
                onChanged: (value) {
                  widget.task.isDone = value;
                  tasks[widget.task.id - 1].isDone = value;
                  setState(() {});
                },
              ),
            )
          : null,
    );
  }
}
