import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/src/bloc/blocs/cat_facts_bloc.dart';
import 'package:flutter_bloc_learning/src/bloc/blocs/counter_bloc.dart';
import 'package:flutter_bloc_learning/src/pages/cat_facts_page.dart';
import 'package:flutter_bloc_learning/src/pages/counter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catFactsBloc = CatFactsBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          builder: (_) => CounterBloc(),
        ),
        BlocProvider<CatFactsBloc>(
          builder: (_) => catFactsBloc,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CatFactsPage(catFactsBloc: catFactsBloc),
      ),
    );
  }
}
