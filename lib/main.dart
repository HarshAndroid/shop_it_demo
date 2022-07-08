import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/products_page.dart';

void main() {
  //for using portrait as default orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  //launching the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //calling products page
    return const MaterialApp(home: ProductsPage());
  }
}
