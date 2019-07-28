import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_learning/pages/cat_facts_page.dart';
import 'package:redux_learning/pages/counter_page.dart';
import 'package:redux_learning/redux/actions/fat_facts_actions.dart';
import 'package:redux_learning/redux/stores/cats_facts_state.dart';
import 'package:redux_learning/redux/stores/counter_state.dart';
import 'package:redux_learning/redux/reducers/cat_facts_reducer.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  final store = Store<CatFactsState>(
    catFactsReducer,
    initialState: CatFactsState(),
    middleware: [thunkMiddleware],
  );
  store.dispatch(FetchCatFactsAction().fetchCats());
  runApp(
    MyApp(
      store: store,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
    @required this.store,
  }) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CatFactsState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CatFactsPage(),
      ),
    );
  }
}
