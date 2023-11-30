import 'package:flutter/material.dart';
import 'package:flutter_project/activity/home_widgets/add_to_cart.dart';
import 'package:flutter_project/model/catalog.dart';
import 'package:flutter_project/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatefulWidget {
  Item catalog;

  HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: (context).canvasColor,
        appBar: AppBar(
          title: Text("Card"),
          toolbarTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: Theme.of(context).appBarTheme.elevation,
          iconTheme: Theme.of(context).appBarTheme.iconTheme,
          centerTitle: Theme.of(context).appBarTheme.centerTitle,
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${widget.catalog.price}"
                  .text
                  .bold
                  .color(Colors.deepOrange)
                  .xl4
                  .make(),
              Container(
                height: 30,
                width: 80,
                child: AddToCart(catalog: widget.catalog),
              )
            ],
          ),
        ),
        body: Column(children: [
          Hero(
              tag: Key(widget.catalog.id.toString()),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.network(widget.catalog.image),
              )),
          Expanded(
            child: VxArc(

              height: 20.0,
              edge: VxEdge.top,
              arcType: VxArcType.convey,
              child: Container(
                width: double.infinity,
                color: Theme.of(context).cardColor,
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Text(
                        widget.catalog.name,
                        style: (TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Theme.of(context).primaryColor)),
                      ),
                      Text(
                        widget.catalog.desc,
                        style:
                            (TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.5))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
