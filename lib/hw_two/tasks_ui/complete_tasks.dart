import 'package:flutter/material.dart';

import '../gloable_data.dart';
import '../task.dart';

class CompleteTasks extends StatefulWidget {
  final Tasks task;
  final Function fun;

  const CompleteTasks({Key key, this.task, this.fun}) : super(key: key);

  @override
  _CompleteTasksState createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      color: Colors.green.withOpacity(0.4),
      child: widget.task.isDone
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
              title: Text("${widget.task.title}"),
              subtitle: Text("${widget.task.subTitle}"),
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
