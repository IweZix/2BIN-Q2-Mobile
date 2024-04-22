class Note {

  late final String titre, description;

  Note({
    required this.titre,
    required this.description,
  });
}

List<Note> _createNotes() {
  final notes = [
    Note(titre: "titre1", description: "description1"),
    Note(titre: "titre2", description: "description2"),
    Note(titre: "titre3", description: "description3"),
    Note(titre: "titre4", description: "description4")
  ];
  return notes;
}

final defaultNotes = _createNotes();