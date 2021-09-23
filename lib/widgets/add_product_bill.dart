import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:shopone/data_objects/bills.dart';
import 'package:shopone/data_objects/item.dart';
import 'package:shopone/screens/sell/add_bill.dart';

class AddProductBill extends StatefulWidget {
  @override
  _AddProductBillState createState() => _AddProductBillState();
}

class _AddProductBillState extends State<AddProductBill> {
  String prodctName = '';
  double? prodctPrice = 0;
  int prodctDiscount = 0;

  @override
  Widget build(BuildContext context) {
    final billItemList = Provider.of<ListOfItems>(context);
    final instanceOfRoughBill = Provider.of<RoughBill>(context);
    List<String> _kOptions = billItemList.allProducts;
    Map<String, double> _mm = billItemList.mm;

    return Container(
      height: 200,
      child: ListView(
        children: [
          Text('Product Name'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _kOptions.where(
                  (String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  },
                );
              },
              onSelected: (String selection) {
                prodctName = selection;
                prodctPrice = _mm[selection];
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return [
                  _mm[prodctName].toString(),
                ];
              },
              initialValue: TextEditingValue(text: 'Price'),
              onSelected: (String selection) {
                prodctPrice = double.parse(selection);
              },
            ),
          ),
          //Text('Discount'),
          Padding(padding: const EdgeInsets.all(8.0), child: TextFormField()),
          TextButton(
              onPressed: () {
                instanceOfRoughBill.addBillItem(
                  BillItem(prodctName, prodctPrice!, prodctDiscount),
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AddBill()),
                  ModalRoute.withName('/'),
                );
              },
              child: Text('Add'))
        ],
      ),
    );
  }
}

class TryingTypeAhead extends StatefulWidget {
  const TryingTypeAhead({Key? key}) : super(key: key);

  @override
  _TryingTypeAheadState createState() => _TryingTypeAheadState();
}

class _TryingTypeAheadState extends State<TryingTypeAhead> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final TextEditingController _typeAheadControllerPrice =
      TextEditingController();
  Map<String, String?> _formData = {
    'name': null,
    'price': null,
    'discount': null,
  };
  final myFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final _billItemList = Provider.of<ListOfItems>(context);
    final instanceOfRoughBill = Provider.of<RoughBill>(context);

    List<String> _kOptions = _billItemList.allProducts;
    Map<String, double> _mm = _billItemList.mm;
    return Container(
      height: 300,
      child: Form(
        key: this._formKey,
        child: Column(
          children: <Widget>[
            //Text('Product Name'),
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(labelText: 'Product Name'),
                controller: this._typeAheadController,
              ),
              suggestionsCallback: (pattern) {
                return _billItemList.getSuggestions(pattern);
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (String suggestion) {
                this._typeAheadController.text = suggestion;
              },
              onSaved: (value) {
                _formData['name'] = value;
                setState(() {});
              },
            ),
            if (_formData['name'] != null)
              TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(labelText: 'Price'),
                  controller: this._typeAheadControllerPrice,
                ),
                suggestionsCallback: (pattern) {
                  return [_mm[_formData['name']].toString()];
                },
                itemBuilder: (context, String suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (String suggestion) {
                  this._typeAheadControllerPrice.text = suggestion;
                },
                onSaved: (value) {
                  _formData['price'] = value;
                  print(_formData['price']);
                },
              ),

            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Next'),
              onPressed: () {
                if (this._formKey.currentState!.validate()) {
                  this._formKey.currentState!.save();
                }
                if (_formData['price'] != null) {
                  instanceOfRoughBill.addBillItem(BillItem(_formData['name']!,
                      double.parse(_formData['price']!), 0));
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddBill()),
                    ModalRoute.withName('/'),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
