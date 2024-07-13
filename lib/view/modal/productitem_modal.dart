import 'package:animation_ecommerce_app/view/modal/product_modal.dart';

class ProductitemModal {
  int quantity;
  final ProductModal? productModal;

  ProductitemModal({this.quantity = 1, required this.productModal});

  void increment() {
    quantity++;
  }
}
