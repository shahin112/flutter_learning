class CatalogModel {
  static List<Item> items = [];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final String price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"].toString(),
      name: map["name"],
      desc: map["desc"] ,
      price: map["price"].toString(),
      color: map["color"] ,
      image: map["image"] ,
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image,
  };
}
