import 'package:get/get.dart';
import 'package:shopapp/models/Product%20Model.dart';

class CartController extends GetxController {
  var cartItems = List.empty(growable: true).obs;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  addToCart(Product product) {
    cartItems.add(product);
  }
}
