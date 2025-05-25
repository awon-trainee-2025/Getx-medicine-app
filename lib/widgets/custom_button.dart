import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.pressed, required this.title});

  final Function()? pressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
      child: Text(title, style: TextStyle(color: Colors.white)),
    );
  }
}
