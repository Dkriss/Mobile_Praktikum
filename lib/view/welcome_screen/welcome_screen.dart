import 'package:flutter/material.dart';
import 'package:modul_mobile/view/dashboard/home_main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              // color: Colors.lightBlue,
              decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  image: DecorationImage(
                    image: AssetImage('assets/1.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              bottom: 24,
              // Menempatkan widget ke bagian bawah layar dengan margin 24
              left: 24,
              // Margin kiri
              right: 24,
              // Margin kanan
              child: Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xFFF5F6F8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Explore Various Natural Beauty of Indonesia',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'you can visit anywhere easily, order your ticket now to get lots of promos',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    // action on press kemana
                    SizedBox(
                      height: 36,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home())),
                        child: const Text('Get Started'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Center(
              child: Column(
                children: [
                  Align(alignment: Alignment.topCenter),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 80),
                    child: Text(
                      'Welcome To U-Travel.Co',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        //backgroundColor: Color(''),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.overline,
                        decorationColor: Colors.white,
                        fontFamily: "Gabarito-Regular",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 2, bottom: 2),
                child: Text(
                  'By dkriss_25',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
