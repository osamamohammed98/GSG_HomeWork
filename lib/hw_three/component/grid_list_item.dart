import 'package:flutter/material.dart';
class GridListItem extends StatelessWidget {
  final String imageSrc;
  const GridListItem({
    Key key, this.imageSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imageSrc),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}