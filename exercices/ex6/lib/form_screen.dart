import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

Future<http.Response> createPost(String url, Map<String, String> body) async {
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(body),
  );

  if (response.statusCode == 2010) {
    // Si le serveur renvoie une réponse OK, parsez le JSON.
    return response;
  } else {
    // Si la réponse n'est pas OK, lancez une exception.
    throw Exception('Failed to create post.');
  }
}

class _FormScreenState extends State<FormScreen> {

  final titleController = TextEditingController();
  final thumbnailUrl = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
                validator: (value) => (value == null || value == "")
                    ? "Title can't be empty"
                    : null,
              ),
              TextFormField(
                controller: thumbnailUrl,
                decoration: const InputDecoration(labelText: "URL"),
                validator: (value) => (value == null || value == "")
                    ? "url can't be empty"
                    : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text("Create"),
                onPressed: () async {
                  var url = 'https://unreal-api.azurewebsites.net/photos';
                  var body = {
                    'title': titleController.text,
                    'thumbnailUrl': thumbnailUrl.text,
                  };

                  var response = await createPost(url, body);

                  // print('Response status: ${response.statusCode}');
                  // print('Response body: ${response.body}');
                },
              )
            ],
          ),
        ),
      ),

    );
  }
}
