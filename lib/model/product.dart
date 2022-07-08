//an item or object to represent a single product

class Product {
  final String name;
  final String price;
  final String image;
  bool isAdded = false;

  Product({this.name = '', this.price = '', this.image = ''});
}
