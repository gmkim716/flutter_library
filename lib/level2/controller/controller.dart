import 'dart:developer';

import 'package:flutter_palworld/level2/data/services.dart';
import 'package:flutter_palworld/level2/model/product_model.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    var products = await Services.fetchProducts();
    if (products != null) {
      productList.value = products;
    } else {
      log('Error');
    }
  }
}
