import 'package:animation_ecommerce_app/view/modal/product_modal.dart';
import 'package:animation_ecommerce_app/view/modal/productitem_modal.dart';
import 'package:flutter/material.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ProductitemModal> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addProductToCart(ProductModal product) {
    for (ProductitemModal item in cart) {
      if (item.productModal!.title == product.title) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(ProductitemModal( productModal: product));
    notifyListeners();
  }


  int totalCartItems() => cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);
}
