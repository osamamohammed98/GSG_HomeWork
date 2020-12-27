import 'package:flutter/material.dart';
import 'package:gsg_homework_app/hw_three/util/style.dart';
import 'package:gsg_homework_app/hw_two/gloable_data.dart';
import 'package:gsg_homework_app/hw_two/provider/task_provider.dart';
import 'package:gsg_homework_app/hw_two/task.dart';
import 'package:provider/provider.dart';

class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  String taskName;
  bool isCompleat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Task"),
      ),
      body: Consumer<TasksProvider>(
        builder: (context, value, child) {
          return  Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Not Text",
                      ),
                      onChanged: (value) {
                        setState(() {
                          taskName = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text("is compleat task"),
                      value: isCompleat,
                      onChanged: (value) {
                        setState(() {
                          isCompleat = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100,),
              RaisedButton(
                child: Text("submit" ,style: TextStyle(color: colorWhite),),
                onPressed: () {
                  value.addNewTask(Tasks(title: taskName , isDone: isCompleat , subTitle: taskName));
                 // tasks.add(Tasks(title: taskName , isDone: isCompleat , subTitle: taskName));
                  Navigator.pop(context);
                },
                color: colorBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
