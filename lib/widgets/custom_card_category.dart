import 'package:flutter/material.dart';

class CustomCardCategory extends StatelessWidget {
  const CustomCardCategory({super.key, required this.category});

  final Map category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 196,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // category['image_url'] == null
            //     ? Image.asset('assets/images/Logo.png', width: 122)
            //     : Image.network(category['image_url'], width: 122),
            Text(
              category['name'],
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}