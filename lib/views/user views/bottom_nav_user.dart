import 'package:flutter/material.dart';
import 'package:medicine_app/views/user%20views/cart_view.dart';
import 'package:medicine_app/views/user%20views/home_view.dart';

class BottomNavUser extends StatefulWidget {
  const BottomNavUser({super.key});

  @override
  State<BottomNavUser> createState() => _BottomNavUserState();
}

class _BottomNavUserState extends State<BottomNavUser> {
  // List of views
  //List of items
  //index

  List views = [HomeView(), CartView()];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            (value) => setState(() {
              index = value;
            }),
        items: items,
        currentIndex: index,
      ),
      body: views.elementAt(index),
    );
  }
}
