import 'package:flutter/material.dart';

import '../custom_ui/shop_item_card.dart';
import '../model/product.dart';
import 'show_cart_page.dart';

//for storing dynamic width & height of device using media query
late Size mq;
//containing all the items or list of products available
final productsList = [
  Product(name: 'Sport Shoes', price: '499', image: 'sneakers'),
  Product(name: 'Backpack', price: '749', image: 'backpack'),
  Product(name: 'Running Shoes', price: '499', image: 'running_shoes'),
  Product(name: 'Hand Bag', price: '299', image: 'handbag'),
  Product(name: 'Rocking Horse', price: '399', image: 'rocking_horse'),
  Product(name: 'Sports Cap', price: '149', image: 'cap'),
  Product(name: 'Smart Watch', price: '999', image: 'smart_watch'),
  Product(name: 'T-shirt', price: '449', image: 't_shirt'),
  Product(name: 'Puzzle', price: '349', image: 'puzzle'),
];

//screen for displaying all products
class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    //getting size of device using media query
    mq = MediaQuery.of(context).size;
    return Scaffold(
        //top app bar of products page
        appBar: AppBar(
          leading: const Icon(Icons.home_rounded, size: 28),
          title: const Text('Add Products'),
          centerTitle: true,
          elevation: 10,
          //move to cart button
          actions: [
            IconButton(
                onPressed: () {
                  //when button is pressed, navigate to show cart page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ShowCartPage())).then((value) {
                    //for updating card (if changes are made in cart details page)
                    setState(() {});
                  });
                },
                icon: const Icon(Icons.shopping_cart_rounded, size: 25))
          ],
        ),
        //open cart button at bottom of screen
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            //when button is pressed, navigate to show cart page
            Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ShowCartPage()))
                .then((value) {
              //for updating card (if changes are made in cart details page)
              setState(() {});
            });
          },
          label: const Text('Open Cart'),
          icon: const Icon(Icons.shopping_cart_rounded),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        //showing all available products
        body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
            itemCount: productsList.length,
            itemBuilder: (ctx, i) => ShopItem(product: productsList[i])));
  }
}
