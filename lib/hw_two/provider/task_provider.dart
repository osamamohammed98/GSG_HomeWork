import 'package:flutter/cupertino.dart';
import 'package:gsg_homework_app/hw_two/task.dart';

class TasksProvider extends ChangeNotifier {
  List<Tasks> tasks = [
    Tasks(title: "Task 1", id: 1, isDone: true, subTitle: "sub title 1"),
    Tasks(title: "Task 2", id: 2, isDone: false, subTitle: "sub title 2"),
    Tasks(title: "Task 3", id: 3, isDone: false, subTitle: "sub title 3"),
    Tasks(title: "Task 4", id: 4, isDone: false, subTitle: "sub title 4"),
    Tasks(title: "Task 5", id: 5, isDone: true, subTitle: "sub title 5"),
    Tasks(title: "Task 6", id: 6, isDone: false, subTitle: "sub title 6"),
    Tasks(title: "Task 7", id: 7, isDone: false, subTitle: "sub title 7"),
    Tasks(title: "Task 8", id: 8, isDone: false, subTitle: "sub title 8"),
    Tasks(title: "Task 9", id: 9, isDone: true, subTitle: "sub title 9"),
    Tasks(title: "Task 10", id: 10, isDone: true, subTitle: "sub title 10"),
  ];

  List<Tasks> doneTasks = [];
  List<Tasks> unDoneTasks = [];

  setTasksList() {
    doneTasks = tasks.where((element) => element.isDone).toList();
    unDoneTasks = tasks.where((element) => !element.isDone).toList();
    notifyListeners();
  }

  addNewTask(Tasks tasksObject){
    tasks.add(tasksObject);
    setTasksList();
  }
  deleteTask(Tasks tasksObject){
   /* int index = tasks.indexOf(tasksObject);
    tasks.removeAt(index);*/
   tasks.remove(tasksObject);
   setTasksList();
  }

  editTasksState(Tasks tasksObject){
    int index = tasks.indexOf(tasksObject);
    tasks[index].isDone = !tasks[index].isDone;
    setTasksList();
  }
}
