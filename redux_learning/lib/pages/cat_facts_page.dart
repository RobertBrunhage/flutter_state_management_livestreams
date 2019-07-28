import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_learning/models/cat_fact.dart';
import 'package:redux_learning/pages/cat_fact_page.dart';
import 'package:redux_learning/redux/actions/fat_facts_actions.dart';
import 'package:redux_learning/redux/stores/cats_facts_state.dart';

class CatFactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat facts app'),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: StoreConnector<CatFactsState, String>(
              converter: (store) => store.state.factsRead,
              builder: (context, factsRead) {
                return Text(
                  'posts read: $factsRead',
                  style: Theme.of(context).primaryTextTheme.title,
                );
              },
            ),
          ),
        ],
      ),
      body: StoreConnector<CatFactsState, CatFactsState>(
        converter: (store) => store.state,
        builder: (context, catsFactState) {
          if (catsFactState.state == LoadingState.loading)
            return Center(child: CircularProgressIndicator());
          else if (catsFactState.state == LoadingState.none)
            return ListView.builder(
              itemCount: catsFactState.catFacts.length,
              itemBuilder: (context, index) {
                final catFact = catsFactState.catFacts[index];
                return CatFactsTile(catFact: catFact);
              },
            );
          else
            return Center(child: Text('There was an error'));
        },
      ),
      floatingActionButton: StoreConnector<CatFactsState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(FetchCatFactsAction().fetchCats());
        },
        builder: (context, fetchFacts) {
          return FloatingActionButton(
            onPressed: fetchFacts,
          );
        },
      ),
    );
  }
}

class CatFactsTile extends StatelessWidget {
  const CatFactsTile({
    Key key,
    @required this.catFact,
  }) : super(key: key);

  final CatFact catFact;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CatFactsState, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(IncrementFactsReadAction);
      },
      builder: (context, incrementFactsRead) {
        return ListTile(
          onTap: () {
            incrementFactsRead();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CatFactPage(catFact: catFact),
              ),
            );
          },
          title: Text(catFact.userName),
          subtitle: Text(catFact.text),
        );
      },
    );
  }
}
