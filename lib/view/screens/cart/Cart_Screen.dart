import 'package:coffee_app/controller/cart_controller.dart';
import 'package:coffee_app/model/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return  Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.Cart_items.length,
                itemBuilder: (context, index) {
                  Product item = cartController.Cart_items[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)} x ${item.quantity}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            cartController.updateQuantity(item, item.quantity - 1);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            cartController.updateQuantity(item, item.quantity + 1);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            cartController.removefromcart(item);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \$${cartController.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          }),
        ],
      ),
    );
  }
}
