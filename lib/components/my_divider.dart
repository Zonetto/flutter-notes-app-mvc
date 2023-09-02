import 'package:flutter/material.dart';

Widget myDivider({
  double end = 0.0,
  Color color = Colors.blue,
}) {
  return Padding(
    padding: EdgeInsetsDirectional.only(
      start: 10.0,
      end: end,
    ),
    child: Container(
      color: color,
      width: double.infinity,
      height: 0.5,
    ),
  );
}
