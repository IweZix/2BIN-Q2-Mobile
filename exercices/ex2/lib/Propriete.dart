class Propriete {

  late final String typeBien, type;
  late final int superficie, nbChambres, prix;

  Propriete({
    required this.typeBien,
    required this.type,
    required this.superficie,
    required this.nbChambres,
    required this.prix,
  });
}

List<Propriete> _createProprietes() {
  final proprietes = [
    Propriete(typeBien: "Maison", type: "Vente", superficie: 200, nbChambres: 4, prix: 200000),
    Propriete(typeBien: "Appartement", type: "Location", superficie: 100, nbChambres: 2, prix: 100000),
    Propriete(typeBien: "Maison", type: "Vente", superficie: 300, nbChambres: 4, prix: 300000),
    Propriete(typeBien: "Appartement", type: "Location", superficie: 200, nbChambres: 2, prix: 200000),
    Propriete(typeBien: "Maison", type: "Vente", superficie: 400, nbChambres: 4, prix: 400000),
    Propriete(typeBien: "Appartement", type: "Location", superficie: 300, nbChambres: 2, prix: 300000),
    Propriete(typeBien: "Maison", type: "Vente", superficie: 500, nbChambres: 4, prix: 500000),
    Propriete(typeBien: "Appartement", type: "Location", superficie: 400, nbChambres: 2, prix: 400000),
    Propriete(typeBien: "Maison", type: "Vente", superficie: 600, nbChambres: 4, prix: 600000),
    Propriete(typeBien: "Appartement", type: "Location", superficie: 500, nbChambres: 2, prix: 500000),
  ];
  return proprietes;
}

final defaultProprietes = _createProprietes();