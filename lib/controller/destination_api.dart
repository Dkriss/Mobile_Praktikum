import 'package:mobilepraktikum/model/destination_model.dart';

class DestinationApi {
  final List<DestinationModel> _destinations;

  DestinationApi(this._destinations);

  List<DestinationModel> searchDestinations(String keyword) {
    return _destinations.where(
            (destination) => destination.title.toLowerCase().contains(keyword.toLowerCase())
    ).toList();
  }
}
