import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'CounterModel.dart';

class MySecondPage extends StatefulWidget {
  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Redux Sample'),
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
                  })
            ],
          ),
        ),
        floatingActionButton: StoreConnector<int, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(Decrement(store.state));
          },
          builder: (context, callback) => FloatingActionButton(
            onPressed: callback,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ),
      ),
    );
  }
}
