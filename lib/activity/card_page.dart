import 'package:flutter/material.dart';
import 'package:flutter_project/core/store.dart';
import 'package:flutter_project/model/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl2.bold.make(),
      ),
      body: Column(
        children: [
          Expanded(child: _Cart_List()),
          _CardTotal(),
        ],
      ),
    ));
  }
}

class _CardTotal extends StatelessWidget {
  const _CardTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as Mystore).cart;

    return SizedBox(
      height: 150,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VxConsumer(
              notifications: {},
              mutations: {RemoveMutation},
              builder:(context, store, status){

               return Text(
                  "\$${_cart.totalPrice}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                );
              },
            ),
            Container(
              height: 30,
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                child: "Buy".text.make(),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondary, // Your color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Cart_List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as Mystore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.done,
                    color: Theme.of(context).colorScheme.primary),
                title: Text(
                  _cart.items[index].name,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  },
                ),
              );
            },
          );
  }
}
