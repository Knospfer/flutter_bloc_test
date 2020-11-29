import 'package:flutter/cupertino.dart';
import 'package:my_bloc_test/src/blocs/item_bloc.dart';

class ItemProvider extends InheritedWidget {
  final bloc = ItemBLoC();

  ItemProvider({key: Key, child: Widget}) : super(key: key, child: child);

  static ItemBLoC of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ItemProvider>()).bloc;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
