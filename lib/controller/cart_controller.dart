import 'package:coffee_app/model/coffee_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
var Cart_items = <Product>[].obs;

  void addtocart(Product product) {
    var index =
        Cart_items.indexWhere((element) => element.title == product.title);
    if (index != -1) {
      Cart_items[index] =
          Cart_items[index].copyWith(quantity: Cart_items[index].quantity + product.quantity);
    } else {
      Cart_items.add(product);
    }
  }

void removefromcart(Product product) {
Cart_items.remove(product);
}

  void updateQuantity(Product item, int quantity) {
    var index = Cart_items.indexWhere((element) => element.title == item.title);
    if (index != -1 && quantity > 0) {
      Cart_items[index] = Cart_items[index]
          .copyWith(quantity: quantity);
    } 
  }


 double get totalPrice => Cart_items.fold(0, (sum, item) => sum + (item.price * item.quantity));
















}
