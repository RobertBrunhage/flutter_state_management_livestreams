import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxvms_learning/models/cat_fact.dart';
import 'package:rxvms_learning/service_locator.dart';
import 'package:rxvms_learning/services/cat_facts_service.dart';

abstract class CatFactsManager {
  RxCommand<void, List<CatFact>> getCatFactsCommand;
  RxCommand<void, int> incrementFactsRead;
  Observable<String> get factsReadCountAsString;
}

class CatFactsManagerImplementation implements CatFactsManager {
  CatFactsManagerImplementation() {
    getCatFactsCommand = RxCommand.createAsyncNoParam<List<CatFact>>(sl<CatFactService>().fetchCatFacts, emitInitialCommandResult: true);

    incrementFactsRead = RxCommand.createSync<void, int>((_) => ++_factsReadCount, emitLastResult: true);
  }

  int _factsReadCount = 0;

  Observable<String> get factsReadCountAsString => incrementFactsRead.map((value) => value.toString());

  @override
  RxCommand<void, List<CatFact>> getCatFactsCommand;

  @override
  RxCommand<void, int> incrementFactsRead;
}
