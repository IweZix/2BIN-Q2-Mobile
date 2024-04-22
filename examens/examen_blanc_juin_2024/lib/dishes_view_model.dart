import 'package:examen_blanc/dish.dart';
import 'package:flutter/material.dart';

/// ViewModel pour les plats utilisé pour gérer le panier dans toute l'application
class DishesViewModel extends ChangeNotifier {
  Map<Dish, int> cart = {};
  double total = 0;

  /// Ajoute un plat au panier
  void addToCart(Dish dish) {
    if (cart.containsKey(dish)) {
      cart[dish] = cart[dish]! + 1;
    } else {
      cart[dish] = 1;
    }
    print(cart.length);
    notifyListeners();
  }

  /// Retire un plat du panier
  void removeFromCart(Dish dish) {
    if (cart.containsKey(dish)) {
      if (cart[dish] == 1) {
        cart.remove(dish);
      } else {
        cart[dish] = cart[dish]! - 1;
      }
    }
    notifyListeners();
  }

  /// Retourne le panier
  Map<Dish, int> getCart() {
    return cart;
  }

  /// Retourne le total du panier
  double getTotal() {
    total = 0;
    cart.forEach((dish, quantity) {
      total += dish.price * quantity;
    });
    return total;
  }

  /// Retourne le nombre total de plats dans le panier
  int getTotalDishes() {
    int totalDishes = 0;
    cart.forEach((dish, quantity) {
      totalDishes += quantity;
    });
    return totalDishes;
  }
}
