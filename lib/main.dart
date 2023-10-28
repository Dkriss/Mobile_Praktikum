import 'package:flutter/material.dart';
import 'package:mobilepraktikum/view/welcome_screen/welcome_screen.dart';


void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen());
  }
}
