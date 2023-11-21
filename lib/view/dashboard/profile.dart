import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilepraktikum/view/welcome_screen/register_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   File? _image;
   final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              // Log out the user
              await _auth.signOut();
              // Navigate to the registration page
              Get.offAll(() => RegistrationPage());
            },
          ),
        ],
      ),
      body: SafeArea(
          child: Stack(
            children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: GestureDetector(
                  onTap: ()async{
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(source: ImageSource.camera);
                    // untuk menyimpan gambar yang telah diambil lewat camera
                    setState(() {
                      _image = File(image!.path);
                    });

                  },
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      image: DecorationImage(
                        image: _image == null ?
                        const AssetImage(
                            'assets/blank_putih.jpg') :
                        FileImage(_image!) as ImageProvider ,
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
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
