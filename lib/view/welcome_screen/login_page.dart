import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilepraktikum/controller/appwrite.dart';
import 'package:mobilepraktikum/view/dashboard/home_main.dart';
import 'package:mobilepraktikum/view/welcome_screen/register_page.dart';

import '../../controller/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final emailControl = TextEditingController();
  final passControl = TextEditingController();
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              /////////////////////////////
              onPressed: () async {
                try {
                  await loginUser(emailControl.text, passControl.text)
                      .then((value) {
                    if (value == true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Login Success"),
                        backgroundColor: Colors.green,
                      ));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(value),
                        backgroundColor: Colors.red,
                      ));
                    }
                  });
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(error.toString()),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const Text('Login'),
            ),
            Row(
              children: [
                const Text(
                  "don't have any account?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ), //text
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => RegistrationPage(),
                    ));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}