import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilepraktikum/view/dashboard/home_main.dart';

class RegistrationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString email = ''.obs;
  RxString password = ''.obs;

  Future<void> register() async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      // Registrasi berhasil
      print('Registrasi berhasil: ${userCredential.user?.email}');
    } catch (e) {
      // Handle error
      print('Error saat registrasi: $e');
    }
  }
}

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxString email = ''.obs;
  RxString password = ''.obs;

  Future<void> login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      // Login successful
      print('Login successful: ${userCredential.user?.email}');

      // Redirect to the home page or any other page after successful login
      Get.offAll(() =>
          const Home()); // Replaces the current route stack with the HomePage
    } catch (e) {
      // Handle error
      print('Error during login: $e');

      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          // Show an alert that the account is not registered
          Get.dialog(
            AlertDialog(
              title: const Text('Account Not Registered'),
              content: const Text(
                  'The provided email is not registered. Please register first.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back(); // Close the alert
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else if (e.code == 'wrong-password') {
          // Show an alert that the password is incorrect
          Get.dialog(
            AlertDialog(
              title: const Text('Incorrect Password'),
              content:
              const Text('The provided password is incorrect. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back(); // Close the alert
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      }
    }
  }
}

