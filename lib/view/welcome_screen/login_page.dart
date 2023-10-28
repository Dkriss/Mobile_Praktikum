import 'package:flutter/material.dart';

import '../dashboard/home_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password Input
                  TextFormField(
                    obscureText: true,
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
                    child: const Text('LoginPage'),
                  ),

                  // Daftar Button
                  TextButton(
                    onPressed: () {
                      // Handle daftar navigation or logic here
                    },
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