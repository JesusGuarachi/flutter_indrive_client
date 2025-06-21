import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final Function(String text) onChanged;
  final String text;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  String? Function(String?)? validator;
  DefaultTextField({
    required this.onChanged,
    super.key,
    required this.text,
    required this.icon,
    this.margin = const EdgeInsets.only(top: 40, left: 20, right: 20),
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: TextFormField(
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
