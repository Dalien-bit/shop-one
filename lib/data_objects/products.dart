import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shopone/data_objects/item.dart';

class Products {
  String? keyword;
  int? id;
  String? autoCompleteTerm;
  int? price;
  String? discount;

  Products({
    this.keyword,
    this.id,
    this.autoCompleteTerm,
    this.price,
    this.discount,
  });

  factory Products.fromJson(Map<String, dynamic> parsedJson) {
    return Products(
        keyword: parsedJson['keyword'] as String,
        id: parsedJson['id'],
        autoCompleteTerm: parsedJson['autocompleteTerm'] as String,
        price: parsedJson['country'],
        discount: parsedJson['discount']
    );
  }
}