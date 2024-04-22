import 'package:ex7/view_model/dialog_view_model.dart';
import 'package:ex7/views/recipient_screen.dart';
import 'package:flutter/material.dart';
import 'package:ex7/views/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'recipients',
          builder: (context, state) => const RecipientsScreen(),
        ),
      ],
    ),
  ],
);


void main() {
  runApp(ChangeNotifierProvider<DialogViewModel>(
    create: (context) => DialogViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}