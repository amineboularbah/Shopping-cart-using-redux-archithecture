import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shoppingCart/Model/cartItem.dart';
import 'package:shoppingCart/Redux/reducers.dart';
import 'package:redux/redux.dart';
import 'package:shoppingCart/ShoppingPage.dart';

void main() {
  final store = Store<List<CartItem>>(cartItemReducer, initialState: List());
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<List<CartItem>> store;
  const MyApp({Key key, this.store}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShoppingPage(store: store),
      ),
    );
  }
}
