import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  Future<List<dynamic>> _fetchData() async {
    final response =
    await get(Uri.parse('https://unreal-api.azurewebsites.net/photos'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/create"),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchData(),
        // snapshot is the data that is returned by the future
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final post = snapshot.data?.reversed.toList()[index];
                return Card(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Row(
                      children: [
                        Image.network(post['thumbnailUrl']),
                        Expanded(
                          child: Column(
                            children: [
                              Text(post['id'].toString()),
                              Text(post['title']),
                            ],
                          ),
                        )
                      ]
                  )
                )
                );
              },
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}