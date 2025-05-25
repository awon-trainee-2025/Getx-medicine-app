import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/main.dart';
import 'package:medicine_app/views/splash_view.dart';

class HomeAdminView extends StatelessWidget {
  const HomeAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          supabase.auth.signOut();
          Get.offAll(SplashView());
        },
        child: Text("Log out"),
      ),
    );
  }
}
