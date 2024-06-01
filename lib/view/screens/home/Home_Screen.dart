import 'package:coffee_app/controller/api/api_home_controller.dart';
import 'package:coffee_app/model/coffee_model.dart';
import 'package:coffee_app/model/newmodel.dart';
import 'package:coffee_app/view/widgets/Item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
        final ApiHomeController apiHomeController = Get.put(ApiHomeController());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.more_horiz_outlined),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "its a great day to drink coffee",
              style: TextStyle(fontSize: 35),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DefaultTabController(
            length: 3,
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    labelStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    indicatorColor: Colors.orange,
                    labelColor: Colors.orange,
                    tabs: <Widget>[
                      Tab(
                        text: "Hot Coffee",
                      ),
                      Tab(
                        text: "Cold Coffee",
                      ),
                      Tab(
                        text: "Cappuiccino",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Obx(() {
                            if (homeController.items.isEmpty) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return GridView.builder(
                                  itemCount: homeController.items.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              2, // number of items in each row
                                          mainAxisSpacing:
                                              10, // spacing between rows
                                          crossAxisSpacing: 10.0,
                                          childAspectRatio: 1 / 1.3),
                                  itemBuilder: (_, i) {
                                    Product item = homeController.items[i];
                                    return ItemWidget(
                                      product: item,
                                    );
                                  });
                            }
                          }),
                        )),
                        Center(child: Obx(() {
                            if (apiHomeController.item.isEmpty) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return GridView.builder(
                                  itemCount: apiHomeController.item.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              2, // number of items in each row
                                          mainAxisSpacing:
                                              10, // spacing between rows
                                          crossAxisSpacing: 10.0,
                                          childAspectRatio: 1 / 1.3),
                                  itemBuilder: (_, i) {
                                    Newmodel item = apiHomeController.item[i];
                                    return ItemWidget12(
                                      product: item,
                                    );
                                  });
                            }
                          }),),
                        Center(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
