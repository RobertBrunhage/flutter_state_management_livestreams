import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_learning/src/mobx/cats_store/cats_store.dart';
import 'package:mobx_learning/src/models/cat_fact.dart';
import 'package:mobx_learning/src/pages/cat_fact_page.dart';
import 'package:provider/provider.dart';

class CatFactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _catsStore = Provider.of<CatsStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cat facts app'),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: Observer(
              builder: (_) {
                return Text(
                  'posts read: ${_catsStore.factsRead}',
                  style: Theme.of(context).primaryTextTheme.title,
                );
              },
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          if (_catsStore.state == LoadingState.loading)
            return Center(child: CircularProgressIndicator());
          else if (_catsStore.state == LoadingState.none)
            return ListView.builder(
              itemCount: _catsStore.catFacts.length,
              itemBuilder: (context, index) {
                final catFact = _catsStore.catFacts[index];
                return CatFactsTile(catFact: catFact);
              },
            );
          else
            return Center(child: Text('There was an error'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _catsStore.fetchCatsFacts,
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
    final _catsStore = Provider.of<CatsStore>(context);
    return ListTile(
      onTap: () {
        _catsStore.incrementFactsRead();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CatFactPage(catFact: catFact),
          ),
        );
      },
      title: Text(catFact.userName),
      subtitle: Text(catFact.text),
    );
  }
}
