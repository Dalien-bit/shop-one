import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopone/data_objects/bills.dart';
import 'package:shopone/data_objects/item.dart';

class BillingTab extends StatefulWidget {
  @override
  _BillingTabState createState() => _BillingTabState();
}

class _BillingTabState extends State<BillingTab> {
  //final _formKey = GlobalKey<FormState>();

  //final TextEditingController _typeAheadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final listBill = Provider.of<ListOfBills>(context).billList;
    return Container(
      color: Colors.black26,
      child: ListView.builder(
        itemCount: listBill.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 100,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(listBill[index].billId),
                  Text(
                    listBill[index].netAmount.toString(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
