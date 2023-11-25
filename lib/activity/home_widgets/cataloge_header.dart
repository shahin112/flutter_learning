import 'package:flutter/material.dart';
import 'package:flutter_project/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App".text.xl3.bold.color(MyTheme.darkBluishColor).make(),
          "Trending products".text.xl2.normal.color(Colors.black).make(),
        ],
      ),
    );
  }
}