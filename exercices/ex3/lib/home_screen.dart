import 'package:ex3/display_note.dart';
import 'package:ex3/form.dart';
import 'package:ex3/note.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> notes = defaultNotes;

  final controllerTitle = TextEditingController();
  final controllerDescription = TextEditingController();

  void addNote(String title, String description) {
    setState(() {
      notes.add(Note(
        titre: title,
        description: description
      ));
    });
  }

  void delete(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Exercice 3'),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child:
                  DisplayNote(notes, delete)
              ),
            ),
            MyForm(addNote: addNote)
          ],
        ),
      ),
    );
  }
}
