import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/activity/card_page.dart';
import 'package:flutter_project/model/catalog.dart';
import 'package:flutter_project/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_widgets/catalog_list.dart';
import 'home_widgets/cataloge_header.dart';

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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CardPage()));
          },
          child: Icon(CupertinoIcons.cart, color: Colors.white),
          backgroundColor: MyTheme.darkBluishColor),
      backgroundColor: (context).canvasColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().expand()
            else
              Center(child: CircularProgressIndicator()).expand(),
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
