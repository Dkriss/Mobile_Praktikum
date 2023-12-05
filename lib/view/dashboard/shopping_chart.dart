import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilepraktikum/controller/db_controller.dart';
import 'package:mobilepraktikum/model/destination_model.dart';

class ShoppingCart extends StatefulWidget {
  final List<DestinationModel> cartItems;

  const ShoppingCart({Key? key, required this.cartItems}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final DbCon = Get.put(DatabaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.cartItems[index].title),
            subtitle: Text(widget.cartItems[index].location),
            // Add more details as needed
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await DbCon.deletePesanan(widget.cartItems[index].id);
                setState(() {
                  widget.cartItems.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
