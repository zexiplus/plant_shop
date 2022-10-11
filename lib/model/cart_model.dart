import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:plant_shop/define/plant.dart';

class CartModel extends ChangeNotifier {
  List<Plant> cartList = [];

  double get totalPrice {
    if (cartList.isEmpty) return 0;
    return cartList
        .map((element) => element.price * element.count)
        .reduce((value, element) => element + value);
  }

  void add(Plant plant) {
    if (cartList.any((element) => element.name == plant.name)) {
      Plant target =
          cartList.firstWhere((element) => element.name == plant.name);
      target.count++;
    } else {
      plant.count++;
      cartList.add(plant);
    }
    notifyListeners();
  }

  void sub(Plant plant) {
    if (cartList.any((element) => element.name == plant.name)) {
      Plant target =
          cartList.firstWhere((element) => element.name == plant.name);
      if (target.count > 1) {
        target.count--;
      } else {
        cartList.remove(target);
      }
    }
    notifyListeners();
  }

  void delete(Plant plant) {
    cartList.removeWhere((element) => element.name == plant.name);
  }

  void removeAll() {
    cartList.clear();
    notifyListeners();
  }
}
