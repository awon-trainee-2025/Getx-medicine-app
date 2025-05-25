import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/controllers/auth_controller.dart';
import 'package:medicine_app/views/auth%20views/login_view.dart';
import 'package:medicine_app/views/auth%20views/verify_otp_view.dart';
import 'package:medicine_app/widgets/custom_auth_widget.dart';
import 'package:medicine_app/widgets/custom_button.dart';
import 'package:medicine_app/widgets/custom_textfeild_widget.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
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
                  'Create an account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                CustomTextfeildWidget(
                  title: 'Name',
                  controller: nameController,
                  secureText: false,
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
                ListTile(
                  title: Text('Admin'),
                  trailing: Radio(
                    value: 'admin',
                    groupValue: controller.selectedOption,
                    onChanged: (value) {
                      controller.updateSelectedOption(value);
                    },
                  ),
                ),
                ListTile(
                  title: Text('User'),
                  trailing: Radio(
                    value: 'user',
                    groupValue: controller.selectedOption,
                    onChanged: (value) {
                      controller.updateSelectedOption(value);
                    },
                  ),
                ),
                CustomButton(
                  title: 'Create an account',
                  pressed: () {
                    controller.createAccount(
                      passwordController.text,
                      emailController.text,
                      nameController.text,
                    );

                    Get.off(VerifyOtpView(email: emailController.text));
                  },
                ),
                CustomAuthWidget(
                  question: 'Do you have an account?',
                  title: 'Login',
                  pressed: () {
                    Get.off(LoginView());
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
