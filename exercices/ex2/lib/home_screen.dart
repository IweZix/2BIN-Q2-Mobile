import 'package:ex2/Propriete.dart';
import 'package:ex2/propriete_row.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Propriete> aVendre = defaultProprietes.where((p) => p.type == "Vente").toList();
  List<Propriete> aLouer = defaultProprietes.where((p) => p.type == "Location").toList();

  bool showSell = false;

  @override
  Widget build(BuildContext context) {
    final displayedProprietes = showSell ? aVendre : aLouer;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Propriétés à vendre/louer')
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Location"),
              ),
              Switch(
                  value: showSell,
                  onChanged: (value) {
                    setState(() {
                      showSell = value;
                    });
                  }
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Vente"),
              )
            ],
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                child: ListView.separated(
                  itemCount: showSell ? aVendre.length : aLouer.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return ProprieteRow(propriete: displayedProprietes[index]);
                  },
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
