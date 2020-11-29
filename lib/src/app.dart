import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bloc_test/src/providers/item_provider.dart';
import 'package:my_bloc_test/src/screens/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemProvider(
      key: key,
      child: MaterialApp(home: HomePage()),
    );
  }
}
