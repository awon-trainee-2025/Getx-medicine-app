import 'package:get/get.dart';
import 'package:medicine_app/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  String? selectedOption = '';

  void updateSelectedOption(String? value) {
    selectedOption = value;
    update();
  }

  void createAccount(String password, String email, String name) async {
    final response = await supabase.auth.signUp(
      password: password,
      email: email,
    );

    await supabase.from('users').insert({
      'id': response.user?.id,
      'name': name,
      'email': email,
      'role': selectedOption,
    });
  }

  void verifyOtp(String otp, String email) async {
    await supabase.auth.verifyOTP(
      type: OtpType.signup,
      token: otp,
      email: email,
    );
  }

  void resendOtp(String email) async {
    await supabase.auth.resend(type: OtpType.signup, email: email);
  }

  void login(String password, String email) async {
    final AuthResponse response = await supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );

    storage?.setString('token', response.session!.accessToken);

    checkRole();
  }

  void checkRole() async {
    final user = supabase.auth.currentUser;

    final response =
        await supabase.from('users').select('role').eq('id', user!.id).single();

    final role = response['role'] as String;

    if (role == 'admin') {
      storage?.setString('role', 'admin');
    } else if (role == 'user') {
      storage?.setString('role', 'user');
    }
  }
}
