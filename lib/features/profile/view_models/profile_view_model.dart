import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  // Données de l'utilisateur
  String fullName = "Anil Kumar";
  String email = "anil29creative@gmail.com";
  String avatarUrl =
      "https://images.unsplash.com/photo-1566492031773-4f4e44671857?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fG1hbnxlbnwwfHwwfHx8MA%3D%3D";

  // Navigation
  void goToProfileEdit(BuildContext context) {
    Navigator.pushNamed(context, '/profileEdit');
  }

  void goToPaymentMethods(BuildContext context) {
    Navigator.pushNamed(context, '/paymentMethods');
  }

  void goToOrdersHistory(BuildContext context) {
    Navigator.pushNamed(context, '/ordersHistory');
  }

  void goToChangePassword(BuildContext context) {
    Navigator.pushNamed(context, '/changePassword');
  }

  void goToInvitesFriends(BuildContext context) {
    Navigator.pushNamed(context, '/invitesFriends');
  }

  void goToFaq(BuildContext context) {
    Navigator.pushNamed(context, '/faq');
  }

  void goToAboutUs(BuildContext context) {
    Navigator.pushNamed(context, '/aboutUs');
  }

  void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/splash', (route) => false);
  }
}
