import 'package:flutter/material.dart';
import 'package:rxvms_learning/managers/cat_facts_manager.dart';
import 'package:rxvms_learning/models/cat_fact.dart';
import 'package:rxvms_learning/service_locator.dart';

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
              StreamBuilder<String>(
                stream: sl<CatFactsManager>().factsReadCountAsString,
                initialData: sl<CatFactsManager>().incrementFactsRead.lastResult.toString(),
                builder: (context, snapshot) {
                  return Text(snapshot.data);
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Total amount of posts: '),
              StreamBuilder<List<CatFact>>(
                stream: sl<CatFactsManager>().getCatFactsCommand,
                initialData: sl<CatFactsManager>().getCatFactsCommand.lastResult,
                builder: (context, snapshot) {
                  return Text(snapshot.data.length.toString());
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
