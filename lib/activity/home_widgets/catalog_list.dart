import 'package:flutter/material.dart';
import 'package:flutter_project/activity/home_details.dart';
import 'package:flutter_project/activity/home_widgets/cataloge_item.dart';
import 'package:flutter_project/model/catalog.dart';

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
          child: InkWell(
            child: CatalogeItem(cataloge: cataloge),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catalog: cataloge),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
