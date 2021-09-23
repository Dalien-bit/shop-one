import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopone/data_objects/bills.dart';
import 'package:shopone/screens/sell/sell_homepage.dart';
import 'package:shopone/widgets/add_product_bill.dart';

class AddBill extends StatefulWidget {
  static const routeName = 'add-bill';

  @override
  _AddBillState createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  @override
  Widget build(BuildContext context) {
    var billListInstance = Provider.of<ListOfBills>(context);
    final roughBillInstance = Provider.of<RoughBill>(context);
    double _netAmount = roughBillInstance.netAmount();

    if (roughBillInstance.ls.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('New bill'),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: Center(
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: Text(
                'Add Product',
              ),
              onPressed: () {
                Navigator.of(context).restorablePush(_dialogBuilder);
              },
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('New bill'),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  roughBillInstance.deleteList();
                },
                icon: Icon(Icons.delete)),
            Chip(
              label: Text(_netAmount.toString()),
            ),
            IconButton(
                onPressed: () {
                  billListInstance.addNewBill(
                    Bill(
                      roughBillInstance.ls,
                      roughBillInstance.netAmount(),
                      DateTime.now().toString(),
                    ),
                  );

                  roughBillInstance.deleteList();

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SellHomepage()),
                      ModalRoute.withName('/'));
                },
                icon: Icon(Icons.done)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.add),
              Text('Product'),
            ],
          ),
          onPressed: () {
            Navigator.of(context).restorablePush(_dialogBuilder);
          },
        ),
        body: Container(
          color: Colors.black26,
          child: ListView.builder(
            itemCount: roughBillInstance.ls.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: Colors.white,
                title: Text(
                  roughBillInstance.ls[index].prodName,
                ),
                leading: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
                trailing: TextButton(
                  child: Text(
                    roughBillInstance.ls[index].prodPrice.toString() +
                        "  -  " +
                        roughBillInstance.ls[index].disc.toString() +
                        "  =  " +
                        (roughBillInstance.ls[index].prodPrice -
                                roughBillInstance.ls[index].disc)
                            .toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    roughBillInstance
                        .deleteItem(roughBillInstance.ls[index].prodName);
                  },
                ),
              );
            },
          ),
        ),
      );
    }
  }
}

Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: TryingTypeAhead(),
      );
    },
  );
}
