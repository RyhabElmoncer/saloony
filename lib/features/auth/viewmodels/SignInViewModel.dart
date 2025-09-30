import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;

  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  void signIn(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Simple validation
    if (email.isEmpty || password.isEmpty) {
      // You can use a SnackBar or any error handling
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    // TODO: Implement real sign-in logic
    Navigator.pushNamed(context, '/home');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
