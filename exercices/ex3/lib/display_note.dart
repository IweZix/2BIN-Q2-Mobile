import 'package:flutter/material.dart';

import 'note.dart';

class DisplayNote extends StatelessWidget {

  List<Note> notes;

  final void Function(int) delete;

  DisplayNote(this.notes, this.delete, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: defaultNotes.length * 2 - 1, // Account for dividers
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return const Divider(); // Add a divider for odd indices
          }
          final itemIndex = index ~/ 2; // Adjusted index for actual items
          return ListTile(
              title: Text(defaultNotes[itemIndex].titre),
              subtitle: Text(defaultNotes[itemIndex].description),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                    delete(itemIndex);
                },
              )
          );
        },
      ),
    );
  }
}

