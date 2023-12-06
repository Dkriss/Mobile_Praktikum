import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  Databases? databases;
  @override
  void onInit() {
    super.onInit();
    Client client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('65681c2876335f043633')
        .setSelfSigned(status: true);
// appwrite
    databases = Databases(client);
  }

  Future storeUserName(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "6570166b4e29ea3012fe",
        documentId: ID.unique(),
        collectionId: "657016b2521a9a756f0a",
        data: map,
        permissions: [
          Permission.read(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
      return result.toMap()['\$id'];
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future deletePesanan(String id) async {
    try {
      final result = await databases!.deleteDocument(
        databaseId: "6570166b4e29ea3012fe",
        documentId: id,
        collectionId: "657016b2521a9a756f0a",
      );
      return result;
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future updateQuantity(String id, int quantity) async {
    try {
      final result = await databases!.updateDocument(
        databaseId: "6570166b4e29ea3012fe",
        documentId: id,
        collectionId: "657016b2521a9a756f0a",
        data: {
          'quantity': quantity,
        },
      );
      return result;
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}