import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/controllers/auth_controller.dart';
import 'package:medicine_app/views/auth%20views/login_view.dart';
import 'package:medicine_app/widgets/custom_button.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter the code',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 8),
                Text(
                  textAlign: TextAlign.start,
                  'We sent a verification code to the email $email',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 32),
                TextField(
                  decoration: InputDecoration(labelText: '421 |'),
                  controller: otpController,
                ),
                SizedBox(height: 20),
                CustomButton(
                  title: 'Send',
                  pressed: () {
                    controller.verifyOtp(otpController.text, email);

                    Get.off(LoginView());
                  },
                ),
                SizedBox(height: 61),
                TextButton(
                  onPressed: () async {
                    controller.resendOtp(email);
                  },
                  child: Text(
                    'Send again',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
