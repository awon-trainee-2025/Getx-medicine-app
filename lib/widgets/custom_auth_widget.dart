import 'package:flutter/material.dart';

class CustomAuthWidget extends StatelessWidget {
  const CustomAuthWidget({super.key, required this.question, this.pressed, required this.title});

  final String question;
  final Function()? pressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: pressed,
          child: Text(title, style: TextStyle(color: Colors.amber)),
        ),
      ],
    );
  }
}
