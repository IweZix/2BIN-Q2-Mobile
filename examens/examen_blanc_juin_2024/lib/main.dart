import 'package:examen_blanc/cart_screen.dart';
import 'package:examen_blanc/dishes_view_model.dart';
import 'package:examen_blanc/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// Router configuration
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'cart',
          builder: (context, state) => const CartScreen(),
        ),
      ],
    ),
  ],
);

/// Main
void main() {
  /// Lance l'app en utilisant le [ChangeNotifierProvider]
  /// pour fournir le [DishesViewModel] à l'ensemble de l'application.
  /// Afin de pouvoir utiliser le [DishesViewModel] dans les widgets.
  runApp(ChangeNotifierProvider<DishesViewModel>(
    create: (context) => DishesViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Utilise le [MaterialApp.router] pour lancer l'application afni de
    /// pouvoir utiliser le [GoRouter]
    return MaterialApp.router(
      /// Utilise le [GoRouter] pour la configuration des routes
      routerConfig: _router,
      title: 'Examen blanc',
      /// Désactive le banner de debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
