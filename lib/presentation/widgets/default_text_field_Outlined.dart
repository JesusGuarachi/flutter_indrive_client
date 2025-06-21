import 'package:flutter/material.dart';

class DefaultTextFieldOutlined extends StatelessWidget {
  final Function(String text) onChanged;
  final String text;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  String? Function(String?)? validator;
  DefaultTextFieldOutlined({
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
        color: const Color.fromRGBO(255, 255, 255, 0.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 37, 100, 151),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 68, 114, 137),
              width: 1,
            ),
          ),
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
