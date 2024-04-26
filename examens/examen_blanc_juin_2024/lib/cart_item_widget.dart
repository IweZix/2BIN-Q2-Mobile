import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dish.dart';
import 'dishes_view_model.dart';

/// Widget pour afficher un plat dans le panier en statefull pour pouvoir
/// retirer ou ajouter au panier
class CartItemWidget extends StatefulWidget {
  final Dish dish;
  final int count;

  const CartItemWidget({super.key, required this.dish, required this.count});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {

  /// Ajoute le plat au panier, fait appel à la méthode addToCart du viewModel
  void addToCart() {
    Provider.of<DishesViewModel>(context, listen: false).addToCart(widget.dish);
  }

  /// Retire le plat du panier, fait appel à la méthode removeFromCart du viewModel
  void removeFromCart() {
    Provider.of<DishesViewModel>(context, listen: false).removeFromCart(widget.dish);
  }

  @override
  Widget build(BuildContext context) {
    /// Récupère le viewModel pour pouvoir afficher le nombre de plats dans le panier
    var viewModel = Provider.of<DishesViewModel>(context);
    /// Calcule le prix total du plat
    double totalPrice = widget.count * widget.dish.price;
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
                width: 100,
                height: 100,
                child: Image.network(widget.dish.imagePath, fit: BoxFit.cover)
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dish.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Unite price: ${widget.dish.price.toStringAsFixed(2)} €',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Consumer<DishesViewModel>(
                    builder: (context, viewModel, child) {
                      int count = viewModel.getCart()[widget.dish] ?? 0;
                      return Text(
                        'x$count',
                        style: const TextStyle(fontSize: 16),
                      );
                    },
                  ),
                  Consumer<DishesViewModel>(
                    builder: (context, viewModel, child) {
                      int count = viewModel.getCart()[widget.dish] ?? 0;
                      double totalPrice = count * widget.dish.price;
                      return Text(
                        totalPrice.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 16),
                      );
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => addToCart(),
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => removeFromCart(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
