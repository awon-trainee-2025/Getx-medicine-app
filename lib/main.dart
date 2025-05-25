import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/views/admin%20views/bottom_nav_admin.dart';
import 'package:medicine_app/views/splash_view.dart';
import 'package:medicine_app/views/user%20views/bottom_nav_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

SharedPreferences? storage;
void main() async {
  await Supabase.initialize(url: 'YOUR_URL', anonKey: 'YOUR_ANON_PUBLIC_KEY');

  storage = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:
          (storage?.getString('token') != null &&
                  storage!.getString('token')!.isNotEmpty &&
                  storage?.getString('role') == 'admin')
              ? BottomNavAdmin()
              : (storage?.getString('token') != null &&
                  storage!.getString('token')!.isNotEmpty &&
                  storage?.getString('role') == 'user')
              ? BottomNavUser()
              : SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
