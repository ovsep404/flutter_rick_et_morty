class Character {
  final String name;
  final String image;
  final String species;
  final String origin;
  final String status;

  Character(
      {required this.name,
      required this.image,
      required this.species,
      required this.origin,
      required this.status});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      image: json['image'],
      species: json['species'],
      origin: json['origin']['name'],
      status: json['status'],
    );
  }
}
