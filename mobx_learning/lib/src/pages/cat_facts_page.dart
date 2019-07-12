import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_learning/src/mobx/cats_store/cats_store.dart';
import 'package:provider/provider.dart';

class CatFactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _catsStore = Provider.of<CatsStore>(context);

    return Scaffold(
      body: Observer(
        builder: (context) {
          if (_catsStore.state == LoadingState.loading)
            return Center(child: CircularProgressIndicator());
          else if (_catsStore.state == LoadingState.none)
            return ListView.builder(
              itemCount: _catsStore.catFacts.length,
              itemBuilder: (context, index) {
                final catFact = _catsStore.catFacts[index];
                return ListTile(
                  title: Text(catFact.type),
                  subtitle: Text(catFact.text),
                );
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
