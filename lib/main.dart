import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopone/data_objects/bills.dart';
import 'package:shopone/data_objects/item.dart';
import 'package:shopone/screens/login_screen.dart';
import 'package:shopone/screens/sell/add_bill.dart';
import 'package:shopone/screens/sell/add_item.dart';
import 'package:shopone/screens/sell/settings.dart';
import 'package:shopone/screens/shop/shop_homepage.dart';
import './screens/sell/add_product_screen.dart';
import 'package:shopone/screens/sell/sell_homepage.dart';

import './screens/guider_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListOfItems()),
        ChangeNotifierProvider(create: (context) => ListOfBills()),
        ChangeNotifierProvider(create: (context) => RoughBill()),
        ChangeNotifierProvider(create: (context) => ApplicationState()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
            routes: {
              SellHomepage.routeName: (context) => SellHomepage(),
              AddProductScreen.routeName: (context) => AddProductScreen(),
              AddItem.routeName: (context) => AddItem(),
              AddBill.routeName: (context) => AddBill(),
              Settings.routeName: (context) => Settings(),
              LoginScreen.routeName: (context) => LoginScreen(),
              ShopHomeage.routeName: (context) => ShopHomeage(),
            },
          );
      },
    );
  }
}
