// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
//
//
// class UserRepository extends GetxController {
//   static UserRepository get instance => Get.find();
//
//   final _db = FirebaseFirestore.instance;
//
//   // Fungsi untuk mendaftarkan pengguna dan menyimpan email dan password ke Firestore
//   Future<bool> signUpWithEmailAndPassword(String email, String password) async {
//     try {
//       // Periksa apakah pengguna dengan email yang sama sudah terdaftar
//       final userQuery = await _db.collection("Users")
//           .where("email", isEqualTo: email)
//           .get();
//
//       if (userQuery.docs.isNotEmpty) {
//         return false; // Pengguna dengan email tersebut sudah terdaftar
//       }
//
//       // Jika pengguna belum terdaftar, daftarkan mereka
//       await _db.collection("Users").add({
//         "email": email,
//         "password": password, // Perhatikan bahwa ini hanya contoh, Anda harus mengenkripsi kata sandi
//       });
//
//       // Daftar berhasil
//       return true;
//     } catch (error) {
//       print("Error during sign-up: $error");
//       return false; // Penanganan kesalahan saat mendaftar
//     }
//   }
// }
