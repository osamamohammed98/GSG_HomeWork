import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_homework_app/hw_two/task.dart';



class CustomSnakeBar extends StatelessWidget {
  final String title;

  const CustomSnakeBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Builder(
          builder: (context) {
            return snakBar(context,title);
          },
        ),

      ),
    );
  }

  snakBar(BuildContext context, String title) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        action: SnackBarAction(
          label: "Close",
          onPressed: (){
            Scaffold.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
