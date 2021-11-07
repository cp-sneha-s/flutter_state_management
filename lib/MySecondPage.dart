import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'CounterStore.dart';

final counter = Counter();

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
          title: Text('MobX Sample'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Observer(builder: (_) {
                return Text(
                  '${counter.count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: counter.decrement,
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ),
      ),
    );
  }
}
