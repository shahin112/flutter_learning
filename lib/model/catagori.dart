class item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final products = [
  item(id: "1", name: "name", desc: "desc", price: 100, color: "#ffffff", image: "https://cdn.pixabay.com/photo/2023/10/12/12/55/woman-8310751_1280.jpg")
];
