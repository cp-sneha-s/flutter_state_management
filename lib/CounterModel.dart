import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _CounterModel extends InheritedWidget {
  final _CounterContainerState data;
  _CounterModel({Key key, @required this.data, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_CounterModel oldWidget) => true;
}

class CounterContainer extends StatefulWidget {
  final Widget child;
  final int count;

  CounterContainer({@required this.child, this.count});
  static _CounterContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_CounterModel)
            as _CounterModel)
        .data;
  }

  @override
  _CounterContainerState createState() => _CounterContainerState();
}

class _CounterContainerState extends State<CounterContainer> {
  int count = 0;
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CounterModel(data: this, child: widget.child);
  }
}
