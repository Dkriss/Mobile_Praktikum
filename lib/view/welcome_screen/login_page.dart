import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilepraktikum/controller/user_model.dart';

import '../../model/user_repository.dart';
import '../dashboard/home_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleSignUp() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password are required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      return;
    }

    final signUpSuccessful = await UserRepository.instance.signUpWithEmailAndPassword(email, password);

    if (signUpSuccessful) {
      Get.snackbar("Success", "Account has been created",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
      // Redirect to login or another page
    } else {
      Get.snackbar("Error", "Failed to create account. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/2.jpg'), // Ganti dengan path gambar yang sesuai
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email Input
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password Input
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // LoginPage Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle LoginPage logic here

                      // Setelah LoginPage berhasil, arahkan pengguna ke halaman Home
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Home(), // Ganti Home() dengan sesuai dengan halaman home Anda
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),

                  // Daftar Button
                  TextButton(
                    onPressed: _handleSignUp,
                    // onPressed: () {
                    //   ////////////// MENGARAH KE TAMPILAN WEB UNTUK DAFTAR /////////////////
                    //   var controller;
                    //   final user = UserModel(
                    //       email: controller.email.text.trim(),
                    //       password: controller.password.text.trim(),
                    //   );
                    // },
                    child: const Text('Daftar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}