import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final Function(String text) onChanged;
  final String text;
  String? intialValue;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  String? Function(String?)? validator;
  final Color backgroundColor;
  DefaultTextField({
    required this.onChanged,
    super.key,
    required this.text,
    required this.icon,
    this.margin = const EdgeInsets.only(top: 40, left: 20, right: 20),
    this.validator,
    this.backgroundColor = Colors.white,
    this.intialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 55,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: TextFormField(
        initialValue: intialValue,
        onChanged: (text) {
          onChanged(text);
        },
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text(text),
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Container(width: 2, height: 20, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
