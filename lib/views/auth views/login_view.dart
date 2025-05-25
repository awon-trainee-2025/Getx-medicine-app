import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/controllers/auth_controller.dart';
import 'package:medicine_app/main.dart';
import 'package:medicine_app/views/admin%20views/bottom_nav_admin.dart';
import 'package:medicine_app/views/auth%20views/create_account_view.dart';
import 'package:medicine_app/views/user%20views/bottom_nav_user.dart';
import 'package:medicine_app/widgets/custom_auth_widget.dart';
import 'package:medicine_app/widgets/custom_button.dart';
import 'package:medicine_app/widgets/custom_textfeild_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                CustomTextfeildWidget(
                  title: 'Email',
                  controller: emailController,
                  secureText: false,
                ),
                CustomTextfeildWidget(
                  title: 'Password',
                  controller: passwordController,
                  secureText: true,
                ),
                CustomButton(
                  title: 'Login',
                  pressed: () {
                    controller.login(
                      passwordController.text,
                      emailController.text,
                    );

                    if (storage?.getString('role') == 'admin') {
                      Get.off(BottomNavAdmin());
                    } else if (storage?.getString('role') == 'user') {
                      Get.off(BottomNavUser());
                    }
                  },
                ),
                CustomAuthWidget(
                  question: 'No account?',
                  title: 'Register',
                  pressed: () {
                    Get.off(CreateAccountView());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
