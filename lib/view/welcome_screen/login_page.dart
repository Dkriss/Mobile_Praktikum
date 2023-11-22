import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilepraktikum/view/welcome_screen/register_page.dart';

import '../../controller/auth_controller.dart';

class LoginPage extends StatelessWidget {
  ///////////////
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
              //////////////////////
              onChanged: (value) => _controller.email.value = value,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              ///////////////////////////
              onChanged: (value) => _controller.password.value = value,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              /////////////////////////////
              onPressed: () => _controller.login(),
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
                ),//text
                TextButton(onPressed: () {
                  Navigator.of(context).
                  pushReplacement(MaterialPageRoute(builder: (context) =>
                      RegistrationPage(),));
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
