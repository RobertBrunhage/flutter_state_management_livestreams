// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CatsStore on _CatsStore, Store {
  final _$catFactsAtom = Atom(name: '_CatsStore.catFacts');

  @override
  List<CatFact> get catFacts {
    _$catFactsAtom.context.enforceReadPolicy(_$catFactsAtom);
    _$catFactsAtom.reportObserved();
    return super.catFacts;
  }

  @override
  set catFacts(List<CatFact> value) {
    _$catFactsAtom.context.conditionallyRunInAction(() {
      super.catFacts = value;
      _$catFactsAtom.reportChanged();
    }, _$catFactsAtom, name: '${_$catFactsAtom.name}_set');
  }

  final _$stateAtom = Atom(name: '_CatsStore.state');

  @override
  LoadingState get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(LoadingState value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$fetchCatsFactsAsyncAction = AsyncAction('fetchCatsFacts');

  @override
  Future<void> fetchCatsFacts() {
    return _$fetchCatsFactsAsyncAction.run(() => super.fetchCatsFacts());
  }
}
