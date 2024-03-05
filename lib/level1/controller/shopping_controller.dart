import 'package:flutter_palworld/level1/model/product_model.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products =
      <Product>[].obs; // products를 observable 등록: 데이터가 바뀌면 UI가 자동으로 업데이트

  @override
  void onInit() {
    super.onInit();

    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // 2초 대기
    var productData = [
      Product(
        id: 1,
        productName: 'Product 1',
        productDescription: 'Product 1 description',
        price: 30,
      ),
      Product(
        id: 2,
        productName: 'Product 2',
        productDescription: 'Product 2 description',
        price: 40,
      ),
      Product(
        id: 3,
        productName: 'Product 3',
        productDescription: 'Product 3 description',
        price: 50,
      ),
      Product(
        id: 4,
        productName: 'Product 4',
        productDescription: 'Product 4 description',
        price: 60,
      ),
      Product(
        id: 5,
        productName: 'Product 5',
        productDescription: 'Product 5 description',
        price: 70,
      ),
    ];

    products.assignAll(productData); // assignAll: products에 productData를 할당
  }
}
