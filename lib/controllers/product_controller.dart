import 'package:get/get.dart';

import '../models/models.dart';

class ProductController extends GetxController {
  List<Product> products = Product.products.obs;

  var newProduct = {}.obs;
  get price => newProduct['price'];
  get quantity => newProduct['quantity'];

  void updateProductPrice(
    int index,
    Product product,
    double value,
  ) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(
    int index,
    Product product,
    int value,
  ) {
    product.quantity = value;
    products[index] = product;
  }
}
