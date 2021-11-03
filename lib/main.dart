import 'package:flutter/material.dart';
import 'package:flutter_state_management/CounterModel.dart';
import 'MyHomePage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<int>(counterReducer, initialState: 0);
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<int> store;

  MyApp({
    this.store,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
