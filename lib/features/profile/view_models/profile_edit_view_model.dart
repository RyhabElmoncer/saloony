import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileEditViewModel extends ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? gender;
  bool isSaving = false;

  // Charger les données du profil dans les contrôleurs
  void setInitialData(Map<String, dynamic> profile) {
    fullNameController.text = profile['fullName'] ?? '';
    emailController.text = profile['email'] ?? '';
    addressController.text = profile['address'] ?? '';
    gender = profile['gender'];
    notifyListeners();
  }

  void setGender(String value) {
    gender = value;
    notifyListeners();
  }

  Future<void> saveProfile() async {
    try {
      isSaving = true;
      notifyListeners();

      final response = await http.put(
        Uri.parse("http://localhost:8088/api/v1/auth/profile"),
        headers: {
          "Content-Type": "application/json",
          // "Authorization": "Bearer $token"
        },
        body: json.encode({
          "fullName": fullNameController.text,
          "email": emailController.text,
          "address": addressController.text,
          "gender": gender,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception("Erreur lors de la sauvegarde");
      }
    } catch (e) {
      debugPrint("Erreur : $e");
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
