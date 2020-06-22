import 'package:flutter/material.dart';
import 'package:shoppingCart/shoppingList.dart';
import 'package:redux/redux.dart';
import 'addButtonDialog.dart';

class ShoppingPage extends StatefulWidget {
  final Store store;
  const ShoppingPage({Key key, this.store}) : super(key: key);
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: ShoppingList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openDialog(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

openDialog(BuildContext context) {
  return showDialog(
      context: context, builder: (BuildContext context) => AddButtonDialog());
}
