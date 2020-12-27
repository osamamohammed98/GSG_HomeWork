import 'package:flutter/material.dart';
import 'package:gsg_homework_app/hw_two/provider/task_provider.dart';
import 'package:provider/provider.dart';

import '../gloable_data.dart';
import '../task.dart';

class AllTasks extends StatefulWidget {
  final Tasks task;
  final Function function;
  const AllTasks({Key key, this.task, this.function}) : super(key: key);

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
        onTap: () {},
        leading: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              // tasks.removeAt(tasks.indexOf(widget.task));
              //showCustomDilaog(context, widget.task, widget.function(widget.task));
              widget.function(context , widget.task);
              CustomSnakeBar(title: "succsfly delete",);
              //widget.function(widget.task);
            });
          },
        ),
        title: Text("${widget.task.title}"),
        subtitle: Text("${widget.task.subTitle}"),
        trailing: Consumer<TasksProvider>(
          builder: (context, values, child) => Checkbox(
            value: widget.task.isDone,
            onChanged: (value) {
              values.editTasksState(widget.task);
              // widget.task.isDone = value;
              // tasks[widget.task.id - 1].isDone = value;
              // setState(() {});
            },
          ),

        ),
      ),
    );
  }
}
