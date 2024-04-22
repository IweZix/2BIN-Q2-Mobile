import 'package:flutter/material.dart';


class MyForm extends StatefulWidget {

  final void Function(String title, String description) addNote;

  const MyForm({super.key, required this.addNote});

  @override
  State<MyForm> createState() => _MyFormState();
}


class _MyFormState extends State<MyForm> {

  final controllerTitle = TextEditingController();
  final controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: controllerTitle,
            decoration: const InputDecoration(labelText: "Enter title"),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? "title can't be empty"
                  : null;
            },
          ),
          TextFormField(
            controller: controllerDescription,
            decoration: const InputDecoration(labelText: "Enter description"),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? "description can't be empty"
                  : null;
            },
          ),
          const SizedBox(width: 50.0),
          ElevatedButton(
            child: const Text('Ajouter'),
            onPressed: () {
              setState(() {
                widget.addNote(controllerTitle.text, controllerDescription.text);
                controllerTitle.text = "";
                controllerDescription.text = "";
              });
            },
          )
        ],
      ),
    );
  }
}