import 'package:coffee_app/model/coffee_model.dart';
import 'package:coffee_app/model/newmodel.dart';
import 'package:coffee_app/view/screens/detail/Detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({super.key, required this.product});

  Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            transition: Transition.leftToRightWithFade,
            DetailScreen(
              product: product,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(blurRadius: 20, spreadRadius: 10)]),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Image.asset(
                  product.image,
                  width: 150,
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title),
                      Text(product.subTitle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.price.toString()),
                          CircleAvatar(
                            child: Icon(Icons.add),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class ItemWidget12 extends StatelessWidget {
  ItemWidget12({super.key, required this.product});

  Newmodel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(DetailScreen(
        //   product: product,
        // ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(blurRadius: 20, spreadRadius: 10)]),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Image.asset(
                  product.url,
                  width: 150,
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title),
                      Text(product.title),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.id.toString()),
                          CircleAvatar(
                            child: Icon(Icons.add),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
