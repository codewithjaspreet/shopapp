import 'package:get/get.dart';
import 'package:shopapp/models/Product%20Model.dart';

class CartController extends GetxController {
  var cartItems = List.from(const []).obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  addToCart(Product product) {
    cartItems.add(product);
  }
}
