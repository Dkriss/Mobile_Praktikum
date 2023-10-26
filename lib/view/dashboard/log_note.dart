// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'dart:io';

class ImageItem {
  String title;
  String description;
  File image;

  ImageItem({required this.title, required this.description, required this.image});
}

class LogNote extends StatefulWidget {
  const LogNote({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LogNoteState createState() => _LogNoteState();
}

class _LogNoteState extends State<LogNote> {
  File? _image;
  List<ImageItem> uploadedImages = [];

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      String? title;
      String? description;

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController titleController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();

          return AlertDialog(
            title: const Text('Add Title and Description'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                    title = titleController.text;
                    description = descriptionController.text;
                    Navigator.pop(context, 'SAVE');
                  } else {
                    // Handle empty fields if necessary.
                    Get.snackbar('Error', 'Please fill in both fields');
                  }
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      ).then((value) {
        if (value == 'SAVE') {
          setState(() {
            _image = File(pickedImage.path);
            uploadedImages.add(ImageItem(
              title: title!,
              description: description!,
              image: _image!,
            ));
          });
        }
      });
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Note'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Main Image',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 100,  // Lebar kotak
              height: 100,  // Tinggi kotak
              decoration: BoxDecoration(
                color: Colors.grey,  // Warna latar belakang
                image: _image != null
                    ? DecorationImage(image: FileImage(_image!), fit: BoxFit.cover)
                    : null,  // Menampilkan gambar jika _image tidak null
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _pickImage(ImageSource.camera);
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: const Text('Pick Image from Gallery'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: uploadedImages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(uploadedImages[index].title),
                    subtitle: Text(uploadedImages[index].description),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(uploadedImages[index].image),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}