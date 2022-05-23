import 'package:get/get.dart';
import 'package:shopapp/models/Product%20Model.dart';

class ShoppingController extends GetxController {
  var products = List.empty(growable: true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var response = [
      Product(
          id: 1,
          price: 30,
          pDesc: 'some description about product',
          pImg: 'abd',
          pName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          pDesc: 'some description about product',
          pImg: 'abd',
          pName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          pDesc: 'some description about product',
          pImg: 'abd',
          pName: 'ThirdProd'),
    ];
    products.value = response;
  }
}
