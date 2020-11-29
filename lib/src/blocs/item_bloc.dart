import 'package:rxdart/rxdart.dart';

class ItemBLoC {
  List<String> _mockStorage = [];

  BehaviorSubject<List<String>> _storeState = BehaviorSubject<List<String>>();

  Stream<List<String>> get itemStream => _storeState.stream;

  submitNewItem(String itemName) {
    _mockStorage.add(itemName);
    _storeState.sink.add(_mockStorage);
  }

  dispose() {
    _storeState.close();
  }
}
