import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopapp/controllers/cartController.dart';
import 'package:shopapp/controllers/shoppingControlller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(
      ShoppingController()); //  get.put so that you can further use it  ,not compulsory but recommended
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: GetX<ShoppingController>(builder: (Controller) {
                return ListView.builder(
                    itemCount: Controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(12),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${Controller.products[index].pName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${Controller.products[index].pDesc}'),
                                    ],
                                  ),
                                  Text('\$${Controller.products[index].price}',
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController.addToCart(
                                      cartController.cartItems[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text('Add to Cart'),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              })),
              GetX<CartController>(builder: (controller) {
                return Text(
                  'Total amount: \$ ${controller.totalPrice}',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                );
              }),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }
}
