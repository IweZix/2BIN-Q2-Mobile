import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dish.dart';
import 'dishes_view_model.dart';

/// Widget pour afficher un plat en statefull pour pouvoir ajouter au panier
class DishWidget extends StatefulWidget {
  final Dish dish;

  const DishWidget({super.key, required this.dish});

  @override
  State<DishWidget> createState() => _DishWidgetState();
}

class _DishWidgetState extends State<DishWidget> {

  /// Ajoute le plat au panier, fait appel à la méthode addToCart du viewModel
  void addToCart() {
   var viewModel = Provider.of<DishesViewModel>(context, listen: false);
    viewModel.addToCart(widget.dish);
  }

  @override
  Widget build(BuildContext context) {
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
                    widget.dish.price.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              /// Appelle addToCart() quand l'icone est cliqué
              onPressed: () => addToCart(),
            ),
          ],
        ),
      ),
    );
  }
}
