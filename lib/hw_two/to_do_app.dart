import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsg_homework_app/hw_two/gloable_data.dart';
import 'package:gsg_homework_app/hw_two/tasks_ui/all_tasks.dart';
import 'package:gsg_homework_app/hw_two/tasks_ui/complete_tasks.dart';
import 'package:gsg_homework_app/hw_two/tasks_ui/pending_tasks.dart';

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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.blue , systemNavigationBarColor: Colors.blue));
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
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
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: tasks
                  .map(
                    (e) => AllTasks(
                      task: e,
                    ),
                  )
                  .toList(),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: tasks
                  .where((element) => element.isDone)
                  .map(
                    (e) => CompleteTasks(
                      task: e,
                    ),
                  )
                  .toList(),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: tasks
                  .where((element) => !element.isDone)
                  .map(
                    (e) => PendingTasks(
                      task: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
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
}






