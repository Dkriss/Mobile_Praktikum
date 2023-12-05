import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilepraktikum/controller/login_register/appwrite.dart';
// import 'package:mobilepraktikum/controller/auth_controller.dart';
import 'package:mobilepraktikum/view/welcome_screen/login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController userNameControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passControl = TextEditingController();

  // final RegistrationController _controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userNameControl,
              // onChanged: (value) => _controller.email.value = value,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: emailControl,
              // onChanged: (value) => _controller.email.value = value,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passControl,
              // onChanged: (value) => _controller.password.value = value,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  await createUser(userNameControl.text, emailControl.text,
                      passControl.text)
                      .then((value) {
                    if (value == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Register Success")));
                      Get.to(() => LoginPage());
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    }
                  });
                } catch (error) {
                  print("Error during registration: $error");
                }
                // ////////////// UNTUK MENUNGGU HINGGA REGISTRASI SELESAI //////////////////
                // await _controller.register();
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 8), // Add some spacing between buttons
            ElevatedButton(
              onPressed: () {
                Get.to(() => LoginPage()); // Navigate to the LoginPage
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}