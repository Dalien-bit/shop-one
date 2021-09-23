import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopone/data_objects/item.dart';
import 'package:shopone/screens/sell/sell_homepage.dart';
import 'package:shopone/screens/shop/shop_homepage.dart';

class GuiderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListOfItems(),
        )
      ],
      child: Scaffold(
        body: Container(
          color: Colors.grey[900],
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 2 / 6,
              width: MediaQuery.of(context).size.width * 2 / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Welcome!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 0.1),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 40,
                        ),
                        Icon(
                          Icons.store,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(child: Container(), flex: 1),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ShopHomeage.routeName);
                            },
                            child: const Text(
                              'Shop',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                          ),
                        ),
                        Expanded(child: Container(), flex: 1),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SellHomepage.routeName);
                            },
                            child: const Text(
                              'Sell',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                          ),
                        ),
                        Expanded(child: Container(), flex: 1),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
