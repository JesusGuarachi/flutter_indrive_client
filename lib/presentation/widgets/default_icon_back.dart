import 'package:flutter/material.dart';

class DefaultIconBack extends StatelessWidget {
  final Color color;
  final EdgeInsetsGeometry? margin;

  const DefaultIconBack({super.key, this.color = Colors.white, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: margin,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: color, size: 35),
      ),
    );
  }
}
