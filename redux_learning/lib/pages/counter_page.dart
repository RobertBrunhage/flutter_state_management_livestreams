import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_learning/redux/actions/counter_actions.dart';
import 'package:redux_learning/redux/stores/counter_state.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<CounterState, int>(
              converter: (store) => store.state.count,
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<CounterState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(IncrementAction(2));
        },
        builder: (context, increment) {
          return FloatingActionButton(
            onPressed: increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
