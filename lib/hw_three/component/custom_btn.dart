import 'package:flutter/material.dart';
import 'package:gsg_homework_app/hw_three/util/style.dart';
class CustomBotton extends StatelessWidget {
  final String text;
  final Function fun;
  final double width;

  const CustomBotton({
    Key key,
    this.text,
    this.fun,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: 35,
      decoration: BoxDecoration(
        color: colorNormal.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "$text",
        style: normalText,
      ),
    );
  }
}
