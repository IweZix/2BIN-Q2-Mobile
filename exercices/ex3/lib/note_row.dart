import 'package:flutter/material.dart';

import 'note.dart';

class NoteRow extends StatelessWidget {

  final Note note;


  const NoteRow({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.titre),
      subtitle: Text(note.titre),
    );
  }
}

