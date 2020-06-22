import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shoppingCart/Redux/actions.dart';

import 'Model/cartItem.dart';

class ShoppingItem extends StatefulWidget {
  final CartItem item;

  const ShoppingItem({Key key, this.item}) : super(key: key);
  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnItemDelete>(
      converter: (store) =>
          (itemName) => {store.dispatch(DeleteItemAction(widget.item))},
      builder: (context, callback) => Dismissible(
        key: Key(widget.item.name),
        child: StoreConnector<List<CartItem>, OnToggleStateAction>(
          converter: (store) =>
              (item) => store.dispatch(ToggleStateItemAction(item)),
          builder: (context, callback) => ListTile(
            title: Text(widget.item.name ?? 'ssssss'),
            leading: Checkbox(
              value: widget.item.checkBox ?? true,
              onChanged: (value) {
                setState(() {
                  callback(CartItem(name: widget.item.name, checkBox: value));
                });
              },
            ),
          ),
        ),
        onDismissed: (_) {
          setState(() {
            callback(widget.item.name);
          });
        },
      ),
    );
  }
}
typedef OnToggleStateAction = Function(CartItem item);
typedef OnItemDelete = Function(String item);
