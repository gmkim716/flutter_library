import 'package:flutter/material.dart';
import 'package:flutter_palworld/level1/controller/cart_controller.dart';
import 'package:flutter_palworld/level1/controller/shopping_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController =
      Get.put(ShoppingController()); // ShoppingController를 GetX에 injection
  final cartController = Get.put(CartController());
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Scrollbar(
        controller: _scrollController,
        thickness: 10,
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length, // 개수
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: EdgeInsets.all(16),
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
                                          '${controller.products[index].productName}',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Text(
                                            '${controller.products[index].productDescription}'),
                                      ],
                                    ),
                                    Text(
                                      '\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24),
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cartController
                                        .addToItem(controller.products[index]);
                                  },
                                  child: Text('Add to cart'),
                                ),
                              ]),
                        ),
                      );
                    });
              }),
            ),
            SizedBox(
              height: 30,
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text(
                  'Total amount: \$${controller.totalPrice}',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                );
              },
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              'Total: ${controller.count}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            );
          },
        ),
        icon: Icon(Icons.add_shopping_cart_rounded, color: Colors.white),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
