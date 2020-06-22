import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shoppingCart/Model/cartItem.dart';
import 'package:shoppingCart/shoppingItem.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, List<CartItem>>(
      converter: (store) => store.state,
      builder: (context, list) => ListView.builder(
        itemBuilder: (context, index) => ShoppingItem(item: list[index]),
        itemCount: list.length,
      ),
    );
  }
}
