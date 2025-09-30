import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileViewModel extends ChangeNotifier {
  String? fullName;
  String? email;
  String? avatarUrl;

  bool isLoading = false;

  // Exemple : récupérer les données du profil depuis le backend
  Future<void> fetchProfile() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await http.get(
        Uri.parse("http://localhost:8088/api/v1/auth/profile"),
        headers: {
          "Content-Type": "application/json",
          // ⚠️ ajoute ton JWT si besoin
          // "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        fullName = data['fullName'];
        email = data['email'];
        avatarUrl = data['avatarUrl'];
      } else {
        throw Exception("Erreur de chargement du profil");
      }
    } catch (e) {
      debugPrint("Erreur : $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Déconnexion
  void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/splash', (route) => false);
  }
}
