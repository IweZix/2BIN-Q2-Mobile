import 'package:examen_blanc/dish.dart';
import 'package:examen_blanc/dishes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item_widget.dart';

/// Widget pour afficher le panier en statefull pour pouvoir fetch le panier
class CartScreen extends StatefulWidget {

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  /// Récupère le panier
  Map<Dish, int> fetchCart() {
    var viewModel = Provider.of<DishesViewModel>(context, listen: false);
    return viewModel.getCart();
  }

  /// Récupère le total du panier
  double fetchTotal() {
    var viewModel = Provider.of<DishesViewModel>(context, listen: false);
    return viewModel.getTotal();
  }

  @override
  Widget build(BuildContext context) {
    /// Récupère le panier
    var cart = fetchCart();
    /// Récupère le total du panier
    double total = fetchTotal();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: 512,
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) => CartItemWidget(
                  dish: cart.keys.elementAt(index),
                  count: cart.values.elementAt(index),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Total: ${total.toStringAsFixed(2)} €',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
