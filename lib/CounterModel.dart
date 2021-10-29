import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
