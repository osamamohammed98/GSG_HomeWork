import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsg_homework_app/hw_three/util/style.dart';
import 'package:gsg_homework_app/hw_two/provider/task_provider.dart';
import 'package:provider/provider.dart';

import 'hw_one/home_work_one_ui_file.dart';
import 'hw_three/profile.dart';
import 'hw_two/to_do_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return ChangeNotifierProvider(
      create: (context) {
        return TasksProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GSG HW',
        theme: ThemeData(
          primaryColor: colorBlue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ToDoApp(),
      ),
    );
  }
}


