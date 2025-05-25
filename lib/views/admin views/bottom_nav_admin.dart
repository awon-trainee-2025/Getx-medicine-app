import 'package:flutter/material.dart';
import 'package:medicine_app/views/admin%20views/home_admin_view.dart';
import 'package:medicine_app/views/admin%20views/shopping_admin_view.dart';

class BottomNavAdmin extends StatefulWidget {
  const BottomNavAdmin({super.key});

  @override
  State<BottomNavAdmin> createState() => _BottomNavAdminState();
}

class _BottomNavAdminState extends State<BottomNavAdmin> {
  // List of views
  //List of items
  //index

  List views = [HomeAdminView(), ShoppingAdminView()];
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
