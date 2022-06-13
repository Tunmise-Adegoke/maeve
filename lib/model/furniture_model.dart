class Furniture {
  final String title;
  final int price;
  final String image;

  Furniture({
    required this.title,
    required this.price,
    required this.image,
  });

  static List<Furniture> furniture = [
    Furniture(
      title: 'OYINBO',
      price: 150000,
      image: 'assets/images/chair 1.png',
    ),
    Furniture(
      title: 'SUKANMI',
      price: 200000,
      image: 'assets/images/chair 3.png',
    ),
    Furniture(
        title: 'ADUKE', price: 50000, image: 'assets/images/figurine 1.png'),
    Furniture(
      title: 'DANJUMA',
      price: 250000,
      image: 'assets/images/chair 4.png',
    ),
    Furniture(
        title: 'IRANTI', price: 60000, image: 'assets/images/figurine 2.png'),
    Furniture(
        title: 'ORE', price: 40000, image: 'assets/images/pear figurine.png'),
    Furniture(
      title: 'HALIMAH',
      price: 100000,
      image: 'assets/images/chair 6.png',
    ),
    Furniture(
        title: 'DUROJAIYE', price: 300000, image: 'assets/images/sofa 2.png'),
    Furniture(
        title: 'OZIOMA', price: 150000, image: 'assets/images/sofa 4.png'),
    Furniture(
        title: 'TUNMISE', price: 400000, image: 'assets/images/sofa 5.png'),
    Furniture(
        title: 'IFUNANYA', price: 300000, image: 'assets/images/sofa 6.png'),
    Furniture(
        title: 'TIMILEYIN', price: 70000, image: 'assets/images/table 1.png'),
    Furniture(
        title: 'AISHAT', price: 60000, image: 'assets/images/table 2.png'),
    Furniture(
        title: 'ATOFARATI', price: 80000, image: 'assets/images/table 3.png'),
    Furniture(title: 'ZARA', price: 35000, image: 'assets/images/table 4.png'),
    Furniture(
        title: 'ADEDAYO', price: 25000, image: 'assets/images/table 5.png'),
    Furniture(
        title: 'TENINUOLA', price: 40000, image: 'assets/images/table 6.png'),
    Furniture(title: 'ADAEZE', price: 25000, image: 'assets/images/vase 1.png'),
  ];
}
