import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {

  final String name, description, imagePath;
  final double price;

  const ProductWidget({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 500,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "$price €",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    description,
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            const SizedBox(width: 16),
            Image.asset(imagePath, width: 150),
          ],
        ),
      ),
    );
  }
}