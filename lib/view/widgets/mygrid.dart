import 'package:coffee_app/controller/home_controller.dart';
import 'package:coffee_app/model/coffee_model.dart';
import 'package:coffee_app/view/widgets/Item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mygrid extends StatelessWidget {
  const Mygrid({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    
    return GridView.builder(
        itemCount: homeController.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 10, // spacing between rows
            crossAxisSpacing: 10.0,
            childAspectRatio: 1 / 1.3),
        itemBuilder: (_, i) {
          Product item = homeController.items[i];
          return ItemWidget(
            product: item,
          );
        });
    
  }
}
