import 'package:flutter/material.dart';
import 'package:tuto1/product_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Welcome to Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Column(
            children: [
              ProductWidget(
                name: "iPhone 15 Pro Max",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Etiam non.",
                imagePath: "images/iphone.jpg",
                price: 1479,
              ),
              ProductWidget(
                name: "GeForce RTX 4080 Super",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Etiam non.",
                imagePath: "images/cg.jpg",
                price: 1299,
              ),
            ],
          )
        ),
      ),
    );
  }
}
