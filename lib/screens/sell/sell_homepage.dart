import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopone/data_objects/bills.dart';
import 'package:shopone/screens/sell/add_bill.dart';
import 'package:shopone/screens/sell/add_item.dart';
import 'package:shopone/screens/sell/settings.dart';
import 'package:shopone/widgets/tabs/analyse_tab.dart';
import 'package:shopone/widgets/tabs/billing_tab.dart';
import 'package:shopone/widgets/tabs/items_tab.dart';
import 'package:shopone/widgets/tabs/order_tab.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Billing'),
  Tab(text: 'Items'),
  Tab(text: 'Orders'),
  Tab(text: 'Analyse'),
];

class SellHomepage extends StatelessWidget {
  static const routeName = '/sell/sell-homepage';

  @override
  Widget build(BuildContext context) {
    //var billInstance = Provider.of<ListOfBills>(context);
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Icon(Icons.store),
                Text(' '),
                Expanded(
                  child: Text(
                    'The Grocery Store',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Settings.routeName);
                  },
                  icon: Icon(Icons.settings),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddItem.routeName);
                  },
                  child: Text(
                    'Add Item',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              tabs: tabs,
              
            ),
            backgroundColor: Colors.black,
          ),
          body: TabBarView(
            children: [
              BillingTab(),
              ItemsTab(),
              Orderstab(),
              AnalyseTab(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(
                context,
                AddBill.routeName,
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.add),
                Text('Bill'),
              ],
            ),
          ),
        );
      }),
    );
  }
}
