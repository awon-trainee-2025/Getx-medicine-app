import 'package:flutter/material.dart';

class CustomTextfeildWidget extends StatelessWidget {
  const CustomTextfeildWidget({super.key, required this.title, required this.controller, required this.secureText});

  final String title;
  final TextEditingController controller;
  final bool secureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextField(
        obscureText: secureText,
        decoration: InputDecoration(labelText: title),
        controller: controller,
      ),
    );
  }
}
