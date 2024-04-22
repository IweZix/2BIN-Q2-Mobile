import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'dish.dart';
import 'dishes_view_model.dart';
import 'menu_widget.dart';

/// HomeScreen en statfull widget pour pouvoir fetch et utiliser state
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Liste des plats (rempli par fetchDishes())
  final List<Dish> dishes = [];

  /// Fetch les plats
  /// Rempli dishes avec les plats fetchés
  Future<void> _initDishes() async {
    try {
      var response = await Dish.fetchDishes();
      setState(() {
        dishes.addAll(response as Iterable<Dish>);
      });
    } catch (error) {
      print(error);
    }
  }

  /// initState est appelé une fois au début de la vie du widget
  @override
  void initState() {
    super.initState();
    _initDishes();
  }

  @override
  Widget build(BuildContext context) {
    /// Récupère le viewModel pour pouvoir afficher le nombre de plats dans le panier
    var viewModel = Provider.of<DishesViewModel>(context);
    /// Récupère le nombre total de plats dans le panier
    int totalDishes = viewModel.getTotalDishes();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => context.go('/cart'),
              ),
              Positioned(
                right: 3,
                bottom: 3,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    totalDishes.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        /// Affiche un loader tant que les plats ne sont pas fetchés
        child: dishes.isNotEmpty
        /// fourni la liste des plats à MenuWidget
            ? MenuWidget(menu: dishes)
            : const CircularProgressIndicator(),
      ),
    );
  }
}
