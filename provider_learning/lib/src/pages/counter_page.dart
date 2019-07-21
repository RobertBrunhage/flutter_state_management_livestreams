import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/src/stores/counter_store.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterStore>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider counter page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterStore>(
              builder: (context, counter, _) {
                return Text(
                  '${counter.count}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
