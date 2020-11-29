import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bloc_test/src/blocs/item_bloc.dart';
import 'package:my_bloc_test/src/providers/item_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ItemProvider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('myBLoC'),
        ),
        body: Container(
            margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
            child: Column(
              children: [
                _nameInput(bloc),
                Container(padding: EdgeInsets.only(bottom: 10.0)),
                Expanded(
                  child: _listView(context, bloc),
                )
                // _listView(context)
              ],
            )));
  }

  Widget _nameInput(ItemBLoC bloc) {
    return TextField(
      decoration:
          InputDecoration(labelText: 'Item Name', hintText: 'Enter a name'),
      onSubmitted: (val) {
        bloc.submitNewItem(val);
      },
    );
  }

  Widget _listView(BuildContext context, ItemBLoC bloc) {
    return StreamBuilder<List<String>>(
      stream: bloc.itemStream,
      builder: (context, snapshot) {
        final itemList = snapshot?.data ?? [];
        return ListView.separated(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(itemList[index]),
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
        );
      },
    );
  }
}
