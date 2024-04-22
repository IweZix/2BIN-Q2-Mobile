import 'package:flutter/material.dart';

class Laureate extends StatelessWidget {
  final String firstname, lastname, motivation;

  const Laureate({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.motivation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
            width: 500,
            child: Card(
              color:Colors.grey[300],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      motivation,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$firstname $lastname",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
