import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color color;
  final EdgeInsetsGeometry margin;
  const DefaultButton({
    required this.onPressed,
    super.key,
    required this.text,
    this.color = const Color(0xFFff4081),
    this.margin = const EdgeInsets.only(top: 40, left: 20, right: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
