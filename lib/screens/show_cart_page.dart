import 'package:flutter/material.dart';

import '../custom_ui/shop_item_card.dart';
import 'products_page.dart';

//screen for displaying all items or products added in cart
class ShowCartPage extends StatefulWidget {
  const ShowCartPage({Key? key}) : super(key: key);

  @override
  State<ShowCartPage> createState() => _ShowCartPageState();
}

class _ShowCartPageState extends State<ShowCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //top app bar of shopping carts page
        appBar: AppBar(
          title: const Text('Shopping Cart'),
          centerTitle: true,
          elevation: 10,
        ),
        //buy now button at bottom of screen
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Buy Now'),
          icon: const Icon(Icons.shopping_cart_checkout_sharp),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        //getting all products which are added to cart & displaying them
        body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
            itemCount:
                productsList.where((e) => e.isAdded == true).toList().length,
            itemBuilder: (ctx, i) => ShopItem(
                product:
                    //filtering all the added items from products list
                    productsList.where((e) => e.isAdded == true).toList()[i])));
  }
}
