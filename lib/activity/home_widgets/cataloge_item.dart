import 'package:flutter/material.dart';
import 'package:flutter_project/activity/home_widgets/add_to_cart.dart';
import 'package:flutter_project/model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import 'cataloge_image.dart';

class CatalogeItem extends StatelessWidget {
  final Item cataloge;

  const CatalogeItem({Key? key, required this.cataloge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: Card(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Container(
          child: Row(
            children: [
              SizedBox(
                height: double.infinity,
                width: MediaQuery.of(context).size.width / 4,
                child: Hero(
                  tag: Key(cataloge.id.toString()),
                  child: CatalogImage(
                    image: cataloge.image,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cataloge.name.text.bold.make(),
                      cataloge.desc.text.textStyle(context.captionStyle).make(),
                      SizedBox(height: 8), // Adjust spacing
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "\$${cataloge.price}".text.make(),
                            Container(
                              height: 30,
                              width: 80,
                              child: AddToCart(catalog: cataloge),
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


