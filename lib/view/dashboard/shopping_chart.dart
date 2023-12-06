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
          DestinationModel item = widget.cartItems[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.location),
                Text('Quantity: ${item.quantity}'), // Display quantity
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    _showEditDialog(item, index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await DbCon.deletePesanan(item.id);
                    setState(() {
                      widget.cartItems.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Function to show an edit dialog for adjusting quantity
  void _showEditDialog(DestinationModel item, int index) {
    int quantity = item.quantity;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Edit Quantity'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Item: ${item.title}'),
                  Text('Current Quantity: $quantity'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text('Quantity: $quantity'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    // Update the quantity in the database
                    await DbCon.updateQuantity(item.id, quantity);

                    // Update the quantity in the local state
                    setState(() {
                      widget.cartItems[index].quantity = quantity;
                    });

                    // Set the item quantity to the updated quantity
                    item.quantity = quantity;

                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}