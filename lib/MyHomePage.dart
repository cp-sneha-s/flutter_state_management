import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_state_management/CounterModel.dart';
import 'MySecondPage.dart';
import 'CounterModel.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux Sample'),
        actions: [
          IconButton(
              icon: Icon(Icons.forward),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MySecondPage(),
                    ));
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<int, String>(
                converter: (store) => store.state.toString(),
                builder: (context, count) {
                  return Text(
                    '$count',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton:
          StoreConnector<int, VoidCallback>(converter: (store) {
        return () => store.dispatch(Increment(store.state));
      }, builder: (context, callback) {
        return FloatingActionButton(
          onPressed: callback,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
