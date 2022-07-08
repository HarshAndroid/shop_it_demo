import 'package:flutter/material.dart';

import '../model/product.dart';
import '../screens/products_page.dart';

//card for representing single shop item(product) details
class ShopItem extends StatefulWidget {
  const ShopItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ShopItem> createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      // change card color according to item is being added or not?
      color: widget.product.isAdded
          ? const Color.fromARGB(255, 238, 255, 243)
          : null,
      //for creating round corners
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: mq.height * .015),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          contentPadding:
              const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
          //product image
          leading: Image.asset('assets/images/${widget.product.image}.png'),

          //product name
          title: Text(widget.product.name),

          //product price
          subtitle: Text('₹ ${widget.product.price}.00'),

          //add to cart button
          trailing: widget.product.isAdded
              ? IconButton(
                  //remove item from shopping cart when this button is pressed
                  onPressed: () {
                    setState(() {
                      widget.product.isAdded = false;
                    });
                  },
                  icon: Image.asset('assets/images/done.png'),
                )
              : ElevatedButton.icon(
                  //add item to shopping cart when this button is pressed
                  onPressed: () {
                    setState(() {
                      widget.product.isAdded = true;
                    });
                    //snackbar to show item added update
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.black.withOpacity(0.7),
                        action: SnackBarAction(label: 'OK', onPressed: () {}),
                        content: const Text('Item successfully added')));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(), elevation: 5),
                  icon: const Icon(Icons.shopping_cart_checkout_rounded),
                  label: const Text('Add')),
        ),
      ),
    );
  }
}
