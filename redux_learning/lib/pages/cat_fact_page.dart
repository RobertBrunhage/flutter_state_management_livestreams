import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_learning/models/cat_fact.dart';
import 'package:redux_learning/redux/stores/cats_facts_state.dart';

class CatFactPage extends StatelessWidget {
  const CatFactPage({
    Key key,
    @required this.catFact,
  }) : super(key: key);

  final CatFact catFact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catFact.userName),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Total amount of posts read: '),
              StoreConnector<CatFactsState, String>(
                converter: (store) => store.state.factsRead,
                builder: (context, factsRead) {
                  return Text(factsRead);
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Total amount of posts: '),
              StoreConnector<CatFactsState, int>(
                converter: (store) => store.state.facts,
                builder: (context, facts) {
                  return Text(facts.toString());
                },
              ),
            ],
          ),
          SizedBox(height: 42),
          Text(catFact.text),
        ],
      ),
    );
  }
}
