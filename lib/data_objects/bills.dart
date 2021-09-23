import 'package:flutter/foundation.dart';

class BillItem {
  final String prodName;
  final double prodPrice;
  final int disc;

  BillItem(this.prodName, this.prodPrice, this.disc);
}

class Bill {
  List<BillItem> listOfProds;
  double netAmount;
  String billId;

  Bill(this.listOfProds, this.netAmount, this.billId);
}

class ListOfBills extends ChangeNotifier {
  List<Bill> _billList = [];

  List<Bill> get billList {
    return [..._billList];
  }

  void addNewBillItem(BillItem newBillItem) {
    _billList[0].listOfProds.add(newBillItem);

    notifyListeners();
  }

  void addNewBill(Bill newBill) {
    _billList.insert(0, newBill);
    notifyListeners();
  }

  void deleteBill(String id) {
    _billList.removeAt(_billList.indexWhere((element) => element.billId == id));

    notifyListeners();
  }
}

class RoughBill extends ChangeNotifier {
  List<BillItem> _ls = [];

  List<BillItem> get ls {
    return [..._ls];
  }

  void addBillItem(BillItem bill) {
    _ls.add(bill);

    notifyListeners();
  }

  void deleteItem(String name) {
    _ls.removeWhere((element) => element.prodName == name);
    notifyListeners();
  }

  void deleteList() {
    _ls.clear();
    notifyListeners();
  }

  double netAmount() {
    double ans = 0;
    for (var i = 0; i < ls.length; i++) {
      ans += (_ls[i].prodPrice - _ls[i].disc);
    }

    return ans;
  }
}
