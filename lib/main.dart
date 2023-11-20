import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilepraktikum/model/user_repository.dart';
import 'package:mobilepraktikum/view/welcome_screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //////////////// API FIREBASE////////////////////
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /////////////////////////////////////////////////
  runApp(const MainPage());
  Get.put(UserRepository());
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
        debugShowCheckedModeBanner: false, home: WelcomeScreen());
  }
}