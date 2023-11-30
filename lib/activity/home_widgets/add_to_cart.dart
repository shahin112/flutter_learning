import 'package:flutter/material.dart';
import 'package:flutter_project/core/store.dart';
import 'package:flutter_project/model/cart.dart';
import 'package:flutter_project/model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

   AddToCart({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);




  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on:[AddMutation,RemoveMutation]);

    final CartModel _cart=(VxState.store as Mystore).cart;

    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);

        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(Icons.add),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Theme.of(context).colorScheme.secondary, // Your color
      ),
    );
  }
}