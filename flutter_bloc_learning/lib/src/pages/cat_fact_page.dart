import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/src/bloc/blocs/cat_facts_bloc.dart';
import 'package:flutter_bloc_learning/src/bloc/states/cat_facts_state.dart';
import 'package:flutter_bloc_learning/src/models/cat_fact.dart';

class CatFactPage extends StatelessWidget {
  const CatFactPage({
    Key key,
    @required this.catFact,
  }) : super(key: key);

  final CatFact catFact;

  @override
  Widget build(BuildContext context) {
    final catFactsBloc = BlocProvider.of<CatFactsBloc>(context);
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
              BlocBuilder<CatFactsBloc, CatFactsState>(
                bloc: catFactsBloc,
                builder: (context, catFactState) {
                  return Text(catFactState.factsRead);
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Total amount of posts: '),
              BlocBuilder<CatFactsBloc, CatFactsState>(
                bloc: catFactsBloc,
                builder: (context, catFactState) {
                  return Text(catFactState.facts.toString());
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
