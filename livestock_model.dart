class Livestock {
  final String category;
  final int age;
  final String sex;
  final String breed;
  final double price;
  final String imagePath;

  Livestock({
    required this.category,
    required this.age,
    required this.sex,
    required this.breed,
    required this.price,
    required this.imagePath,
  });
}

class Seller {
  final String name;
  final String location;
  final String dateListed;

  Seller({
    required this.name,
    required this.location,
    required this.dateListed,
  });
}
