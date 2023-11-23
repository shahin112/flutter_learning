class CatalogModel {
  static final items = [
    Item(
        id: "1",
        name: "this is first item ",
        desc: "this is the product desc",
        price: 100,
        color: "#ffffff",
        image:
            "https://cdn.pixabay.com/photo/2023/10/12/12/55/woman-8310751_1280.jpg"),
    Item(
        id: "2",
        name: "this is second item ",
        desc: "this is the product desc",
        price: 200,
        color: "#ffffff",
        image:
            "https://cdn.pixabay.com/photo/2023/06/20/01/30/ai-generated-8075768_640.jpg"),
    Item(
        id: "3",
        name: "this is third item ",
        desc: "this is the product desc",
        price: 300,
        color: "#ffffff",
        image:
            "https://cdn.pixabay.com/photo/2023/11/05/12/57/squirrel-8367079_1280.jpg"),
  ];
}
class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
