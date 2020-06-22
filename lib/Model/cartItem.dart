import 'package:flutter/cupertino.dart';

class CartItem{
  String name;
  bool checkBox;

  CartItem({@required this.name,@required this.checkBox});

  @override
  String toString() {
    return "$name : $checkBox";
  }
}