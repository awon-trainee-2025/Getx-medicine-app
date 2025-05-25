import 'package:flutter/material.dart';
import 'package:medicine_app/views/user%20views/bottom_nav_user.dart';
import 'package:medicine_app/widgets/custom_button.dart';

class LoginSuccessView extends StatelessWidget {
  const LoginSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(62.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/Group 6577.png'),
              SizedBox(height: 25),
              Text(
                'Email confirmed',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 47),
              Text(
                textAlign: TextAlign.center,
                'Congratulations, your email has been verified. You can start using the app',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 134),
              CustomButton(
                title: 'Continue',
                pressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavUser()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
