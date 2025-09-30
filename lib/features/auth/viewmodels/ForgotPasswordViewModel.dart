import 'package:flutter/material.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  // Validation simple de l'email
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Méthode pour envoyer le lien de réinitialisation
  void sendResetLink(BuildContext context) {
    // Ici tu peux appeler ton API
    // Après succès, naviguer vers LinkSent
    Navigator.pushNamed(context, '/linkSent');
  }

  void disposeControllers() {
    emailController.dispose();
    emailFocusNode.dispose();
  }
}
