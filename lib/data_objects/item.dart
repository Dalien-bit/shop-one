import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:math';


class Product {
  final String productName;
  final int productId;
  final double price;
  final String description;
  final String? photo;
  final bool inStock;

  Product(
    this.productName,
    this.productId,
    this.price,
    this.description,
    this.photo,
    this.inStock,
  );
}

class Item {
  final String itemName;
  final int itemId;
  final String? photo;
  final List<Product>? listOfProducts;

  Item(this.itemName, this.itemId, this.photo, this.listOfProducts);
}

class ListOfItems extends ChangeNotifier {
  List<Item> _itemList = [
    Item(
      'Biscuit',
      1234,
      'photo',
      [
        Product('MarieGold', 12345, 50, 'Delicious healthy Biscuits', 'Photo',
            true),
        Product('Britannia', 12346, 60, 'Delicious healthy Biscuits', 'Photo',
            true),
        Product('Hide and Seek', 12347, 55, 'Delicious healthy Biscuits',
            'Photo', true),
        Product(
            'Oreo', 12348, 100, 'Delicious healthy Biscuits', 'Photo', true),
        Product(
            'GoodDay', 12349, 10, 'Delicious healthy Biscuits', 'Photo', true),
      ],
    ),
    Item(
      'Chocolate',
      1235,
      'photo',
      [
        Product('DairyMilk', 12355, 50, 'Delicious Chocolate', 'Photo', true),
        Product('5 star', 12356, 60, 'Delicious Chocolate', 'Photo', true),
        Product('Dark Chocolate', 12357, 55, 'Delicious healthy Biscuits',
            'Photo', true),
        Product(
            'Ferrero Rocher', 12358, 100, 'Delicious Chocolate', 'Photo', true),
        Product('Chloromint', 12359, 10, 'Delicious Chocolate', 'Photo', true),
      ],
    ),
    Item(
      'Cold Drink',
      1236,
      'photo',
      [
        Product('Coca Cola', 12365, 50, 'Delicious Cold Fresh Drink', 'Photo',
            true),
        Product('Thumbs Up', 12366, 60, 'Delicious Cold Fresh Drink', 'Photo',
            true),
        Product('Pepsi', 12367, 55, 'Delicious Cold Fresh Drink', 'tru', true),
        Product(
            'Sprite', 12368, 100, 'Delicious Cold Fresh Drink', 'Photo', true),
        Product(
            'Mazza', 12369, 10, 'Delicious Cold Fresh Drink', 'Photo', true),
      ],
    ),
    Item(
      'Snacks',
      1237,
      'photo',
      [
        Product('Kur kure', 12375, 50, 'Delicious Spicy Snack', 'Photo', true),
        Product('Lays', 12376, 60, 'Delicious Spicy Snack', 'Photo', true),
        Product('Dorritos', 12377, 55, 'Delicious Spicy Snack', 'tru', true),
        Product(
            'Uncle Chips', 12378, 100, 'Delicious Spicy Snack', 'Photo', true),
        Product('Bingo', 12379, 10, 'Delicious Spicy Snack', 'Photo', true),
      ],
    ),
  ];

  Map<String, double> mm = {
    'Other'.toLowerCase(): 0,
    'MarieGold'.toLowerCase(): 50,
    'Britannia'.toLowerCase(): 60,
    'Hide and Seek'.toLowerCase(): 55,
    'Oreo'.toLowerCase(): 100,
    'GoodDay'.toLowerCase(): 10,
    'DairyMilk'.toLowerCase(): 50,
    'Dark Chocolate'.toLowerCase(): 55,
    'Ferrero Rocher'.toLowerCase(): 100,
    'Chloromint'.toLowerCase(): 10,
    'Coca Cola'.toLowerCase(): 50,
    'Thumbs Up'.toLowerCase(): 60,
    'Pepsi'.toLowerCase(): 55,
    'Sprite'.toLowerCase(): 100,
    'Mazza'.toLowerCase(): 10,
    'Kur kure'.toLowerCase(): 50,
    'Lays'.toLowerCase(): 60,
    'Dorritos'.toLowerCase(): 55,
    'Uncle Chips'.toLowerCase(): 100,
    'Bingo'.toLowerCase(): 10,
  };

  List<Item> get itemList {
    return [..._itemList];
  }

  List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(allProducts);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
  

  final List<String> allProducts = [
    'Other'.toLowerCase(),
    'MarieGold'.toLowerCase(),
    'Britannia'.toLowerCase(),
    'Hide and Seek'.toLowerCase(),
    'Oreo'.toLowerCase(),
    'GoodDay'.toLowerCase(),
    'DairyMilk'.toLowerCase(),
    'Dark Chocolate'.toLowerCase(),
    'Ferrero Rocher'.toLowerCase(),
    'Chloromint'.toLowerCase(),
    'Coca Cola'.toLowerCase(),
    'Thumbs Up'.toLowerCase(),
    'Pepsi'.toLowerCase(),
    'Sprite'.toLowerCase(),
    'Mazza'.toLowerCase(),
    'Kur kure'.toLowerCase(),
    'Lays'.toLowerCase(),
    'Dorritos'.toLowerCase(),
    'Uncle Chips'.toLowerCase(),
    'Bingo'.toLowerCase(),
  ];

  List<String> itemSuggestionList() {
    List<String> lst = [];
    for (var i = 0; i < _itemList.length; i++) {
      lst.add(_itemList[i].itemName);
    }
    return lst;
  }

  void addItem(Item it) {
    _itemList.add(it);

    notifyListeners();
  }

  void removeItem(int id) {
    _itemList.removeWhere((element) => element.itemId == id);
    notifyListeners();
  }

  void addProduct(int itId, Product prod) {
    final index = _itemList.indexWhere((element) => element.itemId == itId);
    _itemList[index].listOfProducts!.add(prod);
    mm.putIfAbsent(prod.productName.toLowerCase(), () => prod.price);
    allProducts.add(prod.productName.toLowerCase());
    notifyListeners();
  }

  void removeProduct(int itId, int prodId) {
    final index = _itemList.indexWhere((element) => element.itemId == itId);
    _itemList[index]
        .listOfProducts!
        .removeWhere((element) => element.productId == prodId);
    final index2 = _itemList[index]
        .listOfProducts!
        .indexWhere((element) => element.productId == prodId);
    mm.remove(
        _itemList[index].listOfProducts![index2].productName.toLowerCase());
    allProducts.removeWhere((element) =>
        element ==
        _itemList[index].listOfProducts![index2].productName.toLowerCase());
    notifyListeners();
  }

  int sizeOfItemList() {
    return _itemList.length;
  }

  int getMeProductDetails(Product prod) {
    for (var i = 0; i < _itemList.length; i++) {
      for (var j = 0; j < _itemList[i].listOfProducts!.length; j++) {}
    }
    return 0;
  }
}

class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    await Future<void>.delayed(Duration(seconds: 1));

    return List.generate(3, (index) {
      return {
        'name': query + index.toString(),
        'price': Random().nextInt(100).toString()
      };
    });
  }
}
