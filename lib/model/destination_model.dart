import 'package:flutter/cupertino.dart';

//penerapan array of object dari class destination information

class DestinationModel {
  final String title;
  final String location;
  final String price;
  final IconData icon;
  final String image;

  DestinationModel(
      {required this.title,
        required this.location,
        required this.price,
        required this.icon,
        required this.image,
        required this.id,
        required this.quantity,});

  String id;
  int quantity;
}