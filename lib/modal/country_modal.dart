class Country {
  final String name;
  final String image;

  Country({required this.name, required this.image});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'],
      image: map['image'],
    );
  }
}
