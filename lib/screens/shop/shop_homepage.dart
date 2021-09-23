import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopone/widgets/shop-homepage-widgets/shop_home_page_widgets.dart';

class ShopHomeage extends StatelessWidget {
  static const routeName = '/shop-homepage';
  final _appBar = AppBar(
    title: Row(
      children: [
        Text(
          'Z',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text('store',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w200,
            )),
      ],
    ),
    backgroundColor: Colors.white,
    automaticallyImplyLeading: true,
    leadingWidth: 30,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
    actions: [
      Row(
        children: [
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  iconSize: 20,
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                  ),
                  iconSize: 20,
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                  iconSize: 20,
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                  iconSize: 20,
                  visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                )
              ],
            ),
          ),
        ],
      )
    ],
  );
  final _drawer = Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          color: Colors.cyan[100],
          height: 150, //padding: EdgeInsets.fromLTRB(20.0, 16.0, 16.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_box_outlined,
                  size: 50,
                ),
                visualDensity: VisualDensity(
                  horizontal: 2,
                  vertical: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Binod',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_sharp),
                      iconSize: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text(
            'Shop By Category',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
          leading: Icon(Icons.category_outlined),
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          color: Colors.black45,
          indent: 18,
        ),
        ListTile(
          title: const Text(
            'Orders',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
          leading: Icon(Icons.delivery_dining_outlined),
          onTap: () {},
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer,
      appBar: _appBar,
      body: Container(
        child: ListView(
          children: [
            CategoryListTile(),
            
          ],
        ),
      ),
    );
  }
}
