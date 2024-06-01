import 'dart:convert';

import 'package:coffee_app/model/coffee_model.dart';
import 'package:coffee_app/view/screens/cart/Cart_Screen.dart';
import 'package:coffee_app/view/screens/favourite/Favourite_Screen.dart';
import 'package:coffee_app/view/screens/home/Home_Screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  RxInt Screen_index = 0.obs;

  List pages = [
    HomeScreen(),
    CartScreen(),
    FavouriteScreen(),
  ].obs;

  void changeIndex(int index) {
    Screen_index.value = index;
  }

  var items = <Product>[].obs;

  Future<void> fetchItems() async {
    final String response =
        await rootBundle.loadString('assets/jsons/coffeeJSON.json');
    final List<dynamic> data = json.decode(response);
    items.value = data.map((item) => Product.fromJson(item)).toList();
  }
}
