import 'package:ex2/Propriete.dart';
import 'package:flutter/material.dart';

import 'Propriete.dart';

class ProprieteRow extends StatelessWidget {

  final Propriete propriete;


  const ProprieteRow({
    Key? key,
    required this.propriete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${propriete.type} : ${propriete.typeBien} de ${propriete.superficie} m²"),
      subtitle: Text("${propriete.nbChambres} chambres - ${propriete.prix} €"),
    );
  }
}

