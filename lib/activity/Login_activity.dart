import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/activity/card_page.dart';
import 'package:flutter_project/core/store.dart';
import 'package:flutter_project/model/cart.dart';
import 'package:flutter_project/model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
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
  final url = "https://metcosoft.com/my_flutter/products.php";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as Mystore).cart;
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CardPage()));
          },
          backgroundColor: Colors.deepPurple,
          child: Icon(CupertinoIcons.cart, color: Colors.white),
        ).badge(color: Vx.red500, size: 22, count: _cart.items.length),
      ),
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
      // final catalogJson =
      //     await rootBundle.loadString('assets/files/catalog.json');
      final resonse = await http.get(Uri.parse(url));
      final catalogJson=resonse.body;
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
