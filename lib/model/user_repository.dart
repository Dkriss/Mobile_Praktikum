import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilepraktikum/controller/user_model.dart';

// class UserRepository extends GetxController{
//   static UserRepository get instance => Get.find();
//
//   final _db = FirebaseFirestore.instance;
//
//   createUser(UserModel user) async {
//   await _db.collection("Users").add(user.toJson())
//         .whenComplete(
//       /////////////////  PEMANGGILAN SNACKBAR JIKA SUCCES MEMBUAT AKUN TERSEBUT ////////////////////////
//             () => Get.snackbar("Success", "You account has been created",
//               snackPosition: SnackPosition.BOTTOM,
//               backgroundColor: Colors.green.withOpacity(0.1),
//               colorText: Colors.green),
//             )
//         .catchError((error, stackTrace){
//           Get.snackbar("Error", "Something went wrong. Try again",
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red.withOpacity(0.1),
//             colorText: Colors.red);
//           print(error.toString());
//     });
//   }
// }

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Fungsi untuk mendaftarkan pengguna dan menyimpan email dan password ke Firestore
  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    try {
      // Periksa apakah pengguna dengan email yang sama sudah terdaftar
      final userQuery = await _db.collection("Users")
          .where("email", isEqualTo: email)
          .get();

      if (userQuery.docs.isNotEmpty) {
        return false; // Pengguna dengan email tersebut sudah terdaftar
      }

      // Jika pengguna belum terdaftar, daftarkan mereka
      await _db.collection("Users").add({
        "email": email,
        "password": password, // Perhatikan bahwa ini hanya contoh, Anda harus mengenkripsi kata sandi
      });

      // Daftar berhasil
      return true;
    } catch (error) {
      print("Error during sign-up: $error");
      return false; // Penanganan kesalahan saat mendaftar
    }
  }
}
