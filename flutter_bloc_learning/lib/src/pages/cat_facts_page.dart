import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/src/bloc/blocs/cat_facts_bloc.dart';
import 'package:flutter_bloc_learning/src/bloc/events/cat_facts_events.dart';
import 'package:flutter_bloc_learning/src/bloc/states/cat_facts_state.dart';
import 'package:flutter_bloc_learning/src/models/cat_fact.dart';
import 'package:flutter_bloc_learning/src/pages/cat_fact_page.dart';

class CatFactsPage extends StatefulWidget {
  const CatFactsPage({
    Key key,
    @required this.catFactsBloc,
  }) : super(key: key);
  final CatFactsBloc catFactsBloc;

  @override
  _CatFactsPageState createState() => _CatFactsPageState();
}

class _CatFactsPageState extends State<CatFactsPage> {
  @override
  void initState() {
    super.initState();
    // start the fetching of facts
    FetchCatFacts(widget.catFactsBloc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat facts app'),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: BlocBuilder<CatFactsBloc, CatFactsState>(
              bloc: widget.catFactsBloc,
              builder: (context, catFactState) {
                return Text(
                  'posts read: ${catFactState.factsRead}',
                  style: Theme.of(context).primaryTextTheme.title,
                );
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<CatFactsBloc, CatFactsState>(
        bloc: widget.catFactsBloc,
        builder: (context, catFactState) {
          if (catFactState.state == LoadingState.loading)
            return Center(child: CircularProgressIndicator());
          else if (catFactState.state == LoadingState.none)
            return ListView.builder(
              itemCount: catFactState.catFacts.length,
              itemBuilder: (context, index) {
                final catFact = catFactState.catFacts[index];
                return CatFactsTile(catFact: catFact);
              },
            );
          else
            return Center(child: Text('There was an error'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => FetchCatFacts(widget.catFactsBloc),
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
    final catFactsBloc = BlocProvider.of<CatFactsBloc>(context);
    return ListTile(
      onTap: () {
        catFactsBloc.dispatch(IncrementFactsRead());
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
