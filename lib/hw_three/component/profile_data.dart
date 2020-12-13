import 'package:flutter/material.dart';
import 'package:gsg_homework_app/hw_three/util/style.dart';
class ProfileData extends StatelessWidget {
  final String title, value;

  const ProfileData({
    Key key,
    this.title,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$value",
          style: bigText,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "$title",
          style: normalText,
        ),
      ],
    );
  }
}
