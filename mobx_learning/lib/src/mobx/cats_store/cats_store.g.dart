// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CatsStore on _CatsStore, Store {
  Computed<int> _$factsComputed;

  @override
  int get facts => (_$factsComputed ??= Computed<int>(() => super.facts)).value;
  Computed<String> _$factsReadComputed;

  @override
  String get factsRead =>
      (_$factsReadComputed ??= Computed<String>(() => super.factsRead)).value;

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

  final _$factsReadCountAtom = Atom(name: '_CatsStore.factsReadCount');

  @override
  int get factsReadCount {
    _$factsReadCountAtom.context.enforceReadPolicy(_$factsReadCountAtom);
    _$factsReadCountAtom.reportObserved();
    return super.factsReadCount;
  }

  @override
  set factsReadCount(int value) {
    _$factsReadCountAtom.context.conditionallyRunInAction(() {
      super.factsReadCount = value;
      _$factsReadCountAtom.reportChanged();
    }, _$factsReadCountAtom, name: '${_$factsReadCountAtom.name}_set');
  }

  final _$fetchCatsFactsAsyncAction = AsyncAction('fetchCatsFacts');

  @override
  Future<void> fetchCatsFacts() {
    return _$fetchCatsFactsAsyncAction.run(() => super.fetchCatsFacts());
  }

  final _$_CatsStoreActionController = ActionController(name: '_CatsStore');

  @override
  void incrementFactsRead() {
    final _$actionInfo = _$_CatsStoreActionController.startAction();
    try {
      return super.incrementFactsRead();
    } finally {
      _$_CatsStoreActionController.endAction(_$actionInfo);
    }
  }
}
