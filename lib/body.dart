import 'package:coffee_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeController.Screen_index.value,
        onTap: homeController.changeIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        ],
      ),
      body: Obx(() {
        return homeController.pages[homeController.Screen_index.value];
      }),
    );
  }
}
