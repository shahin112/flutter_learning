import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/model/catalog.dart';
import 'package:flutter_project/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class Login_activity extends StatefulWidget {
  const Login_activity({
    Key? key,
  }) : super(key: key);

  @override
  State<Login_activity> createState() => _Login_activityState();
}

class _Login_activityState extends State<Login_activity> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().expand()
            else
              Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    ));
  }

  void loadData() async {
    try {
      final catalogJson =
          await rootBundle.loadString('assets/files/catalog.json');
      final decodedData = jsonDecode(catalogJson);
      var productData = decodedData["products"];
      print(productData);
      CatalogModel.items = List.from(productData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();

      setState(() {});
    } catch (e) {
      print('Error loading data: $e');
    }
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl3.bold.color(MyTheme.darkBluishColor).make(),
        "Trending products".text.xl2.normal.color(Colors.black).make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final cataloge = CatalogModel.items[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1),
          // Adjust the margin as needed
          child: CatalogeItem(cataloge: cataloge),
        );
      },
    );
  }
}

class CatalogeItem extends StatelessWidget {
  final Item cataloge;

  const CatalogeItem({Key? key, required this.cataloge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Container(
          child: Row(
            children: [
              // Left Half: Image
              SizedBox(
                height: double.infinity,
                width: MediaQuery.of(context).size.width / 4,
                child: CatalogImage(
                  image: cataloge.image,
                ),
              ),
              // Right Half: Details
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Name
                      cataloge.name.text.bold.make(),
                      // Description
                      cataloge.desc.text.textStyle(context.captionStyle).make(),
                      SizedBox(height: 8), // Adjust spacing
                      // Divider Line

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Price
                            "\$${cataloge.price}".text.make(),
                            Container(
                              height: 30,
                              width: 70,
                              padding: EdgeInsets.zero,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: "Add".text.make(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      MyTheme.darkBluishColor, // Your color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.cover,
    );
  }
}
