import 'package:appwrite/appwrite.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

////////////////////////////////////
// CLIENT CONTROLER BUAT
////////////////////////////////////

class ClientController extends GetxController {
  Client client = Client();
  @override
  void onInit() {
    super.onInit();
// appwrite
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "65672a4d2f050e5a3cf7";
    client.setEndpoint(endPoint).setProject(projectID).setSelfSigned(status: true);
  }
}