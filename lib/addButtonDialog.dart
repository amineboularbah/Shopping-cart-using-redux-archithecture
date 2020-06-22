import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shoppingCart/Model/cartItem.dart';
import 'package:shoppingCart/Redux/actions.dart';

class AddButtonDialog extends StatefulWidget {
  @override
  _AddButtonDialogState createState() => _AddButtonDialogState();
}

class _AddButtonDialogState extends State<AddButtonDialog> {
  String itemName;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnItemAddedCallBack>(
      converter: (store) =>(itemName) =>store.dispatch(AddItemAction(item: CartItem(name: itemName,checkBox: false))),
      builder: (context, callback)=> AlertDialog(
      title: Text('Add Item'),
      contentPadding: const EdgeInsets.all(12.0),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              onChanged: (value){
                setState(() {
                  itemName = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Item Name", hintText: "Eg. Samsung"
              ),
            ),
          )
        ],
      ),
      actions: [
        FlatButton(
          onPressed: (){
          Navigator.pop(context);
        },
        child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: (){
          callback(itemName);
          Navigator.pop(context);
        },
        child: Text('Add'),
        )
        
      ],
    )
  );
  }
}

typedef OnItemAddedCallBack = Function(String itemName);