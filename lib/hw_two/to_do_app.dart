import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsg_homework_app/hw_two/add_task.dart';
import 'package:gsg_homework_app/hw_two/provider/task_provider.dart';
import 'package:gsg_homework_app/hw_two/task.dart';
import 'package:gsg_homework_app/hw_two/tasks_ui/all_tasks.dart';
import 'package:gsg_homework_app/hw_two/tasks_ui/complete_tasks.dart';
import 'package:gsg_homework_app/hw_two/tasks_ui/pending_tasks.dart';
import 'package:provider/provider.dart';

class ToDoApp extends StatefulWidget {
  @override
  _ToDoAppState createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int indexItemBtn = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  showCustomDilaog(BuildContext context, Tasks tasksObj) {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.blue, systemNavigationBarColor: Colors.blue));
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddNewTask(),
                ));
              })
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "All Tasks",
            ),
            Tab(
              text: "Complete",
            ),
            Tab(
              text: "pending",
            ),
          ],
        ),
      ),
      body: Consumer<TasksProvider>(
        builder: (context, value, child) {
          return TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: value.tasks
                      .map(
                        (e) => AllTasks(
                          task: e,
                          function: (context, e) {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Delete"),
                                  content:
                                      Text("Are you want delete this tasks?"),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          value.deleteTask(e);
                                          /*tasks.remove(e);
                            setState(() {});*/
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok")),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("No")),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: value.doneTasks
                      .map(
                        (e) => CompleteTasks(
                          task: e,
                          fun: (context, e) {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Delete"),
                                  content:
                                      Text("Are you want delete this tasks?"),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          value.deleteTask(e);
                                          /*tasks.remove(e);
                                            setState(() {});*/
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok")),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("No")),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: value.unDoneTasks
                      .map(
                        (e) => PendingTasks(
                          task: e,
                          fun: (context, e) {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Delete"),
                                  content:
                                      Text("Are you want delete this tasks?"),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          value.deleteTask(e);
                                          /*tasks.remove(e);
                                    setState(() {});*/
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok")),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("No")),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexItemBtn,
        onTap: (value) {
          _tabController.animateTo(value);
          indexItemBtn = value;
          //todo set state
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: "All Tasks",
            icon: Icon(Icons.notes),
          ),
          BottomNavigationBarItem(
            label: "Complete",
            icon: Icon(Icons.done),
          ),
          BottomNavigationBarItem(
            label: "pending",
            icon: Icon(Icons.pending),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  deleteAt(Tasks e) {}
}
