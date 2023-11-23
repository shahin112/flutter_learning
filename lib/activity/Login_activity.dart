import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/model/catalog.dart';
import 'package:flutter_project/widgets/drawer.dart';
import 'package:flutter_project/widgets/item_widget.dart';

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
    final Dummy_list = List.generate(50, (index) => CatalogModel.items[2]);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Catalog"),
            ),
            body: ListView.builder(
              itemCount: Dummy_list.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemWidget(
                  item: Dummy_list[index],
                );
              },
            ),
            drawer: Mydrawer()));
  }

  void loadData() async {
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var productdata = decodedData["products"];
    print(productdata);
  }
}
